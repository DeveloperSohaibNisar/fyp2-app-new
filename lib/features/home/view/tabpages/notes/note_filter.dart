import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/note/notes_viewmodel.dart';

class NoteFilterContainer extends StatelessWidget {
  const NoteFilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(color: Color.fromRGBO(246, 249, 252, 1)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(style: TextStyle(fontSize: 18), 'Notes'),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Color(0xFFFE600C),
                      selectionColor: Color(0xFFFE600C),
                      selectionHandleColor: Color(0xFFFE600C),
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      filled: true,
                      fillColor: Color.fromRGBO(118, 118, 128, 0.12),
                      prefixIcon: Icon(Icons.search, shadows: <Shadow>[Shadow(color: Color.fromRGBO(0, 0, 0, .20), blurRadius: 4, offset: Offset(0, 4))]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search For List',
                    ),
                  ),
                ),
              ),
              const SortMenu(),
              const SortToogle(),
            ],
          ),
        ]),
      ),
    );
  }
}

class SortToogle extends ConsumerWidget {
  const SortToogle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          ref.read(notesViewmodelProvider.notifier).toogleNotesOrder();
        },
        icon: const Icon(Icons.swap_vert));
  }
}

class SortMenu extends ConsumerStatefulWidget {
  const SortMenu({super.key});

  @override
  ConsumerState<SortMenu> createState() => _SortMenuState();
}

class _SortMenuState extends ConsumerState<SortMenu> {
  NotesSortMenuItems? selectedItem;

  @override
  Widget build(
    BuildContext context,
  ) {
    return PopupMenuButton<NotesSortMenuItems>(
      icon: const Icon(Icons.sort),
      initialValue: selectedItem,
      onSelected: (NotesSortMenuItems item) {
        setState(() {
          selectedItem = item;
        });
        ref.read(notesViewmodelProvider.notifier).sortNotes(selectedItem);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<NotesSortMenuItems>>[
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.title,
          child: Text('Title'),
        ),
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.creationDate,
          child: Text('Creation Date'),
        ),
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.editDate,
          child: Text('Last Edited'),
        ),
        const PopupMenuItem<NotesSortMenuItems>(
          value: NotesSortMenuItems.lines,
          child: Text('Lines'),
        ),
      ],
    );
  }
}
