import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/note/notes_viewmodel.dart';
import 'package:fyp2_clean_architecture/features/note_editor/view/note_editor_view.dart';

import 'package:intl/intl.dart';

class NoteList extends ConsumerWidget {
  NoteList({super.key});
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsyncValue = ref.watch(notesViewmodelProvider);
    final notes = notesAsyncValue.value ?? [];
    final isInitialLoading = notesAsyncValue.isLoading && notes.isEmpty;
    final hasmore = ref.watch(notesViewmodelProvider.notifier).hasMore;
    final isFetchingMore = notesAsyncValue.isLoading && notes.isNotEmpty;

    void scrollControllerListener() {
      if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
        if (!isFetchingMore && hasmore) {
          ref.read(notesViewmodelProvider.notifier).fetchmore();
        }
      }
    }

    _scrollController.addListener(scrollControllerListener);

    return isInitialLoading
        ? const Loader()
        : Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: notes.isEmpty
                ? Center(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Color.fromRGBO(31, 51, 228, 1),
                            Color.fromRGBO(6, 121, 225, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        'No Notes',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: notes.length + (!hasmore || isFetchingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index <= notes.length - 1) {
                        final note = notes[index];
                        return NoteListTile(note: note);
                      } else if (isFetchingMore) {
                        return const Column(
                          children: [
                            SizedBox(height: 16),
                            Loader(),
                            SizedBox(height: 16),
                          ],
                        );
                      } else if (!hasmore) {
                        return ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [
                                Color.fromRGBO(31, 51, 228, 1),
                                Color.fromRGBO(6, 121, 225, 1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: const Column(
                            children: [
                              SizedBox(height: 16),
                              Text(
                                textAlign: TextAlign.center,
                                'No More Notes',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    separatorBuilder: ((context, index) => const Divider()),
                  ),
          );
  }
}

class NoteListTile extends ConsumerWidget {
  const NoteListTile({
    super.key,
    required this.note,
  });

  final NoteListItemModel note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black.withOpacity(.25), offset: const Offset(0, 4))],
        ),
        child: const CircleAvatar(
          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
          child: Icon(
            Icons.description_outlined,
            weight: 100,
            grade: -25,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(note.name),
      titleTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
      subtitleTextStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(.51)),
      subtitle: Text('Last Edited: ${DateFormat('dd-MMM-yyyy').format(note.updatedAt)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${note.linesCount}-Lines'),
          const Icon(Icons.more_vert),
        ],
      ),
      onTap: () async {
        var result = await Navigator.pushNamed(context, NoteEditorView.routeName, arguments: note);
        if (result is NoteListItemModel) {
          ref.read(notesViewmodelProvider.notifier).updateNote(newNote: result);
        }
      },
    );
  }
}
