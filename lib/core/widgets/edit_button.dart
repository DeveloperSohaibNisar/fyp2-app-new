import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/models/summary/summary_data.dart';
import 'package:fyp2_clean_architecture/core/providers/note_editor/note_editor_viewmodel.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/core/widgets/custom_modal.dart';
import 'package:fyp2_clean_architecture/features/note_editor/view/note_editor_view.dart';

class EditButton extends ConsumerWidget {
  const EditButton({
    super.key,
    required this.summaryData,
    required this.transcriptionText,
  });
  final SummaryData summaryData;
  final String? transcriptionText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(noteEditorViewmodelProvider, (prev, next) {
      next.when(
          data: (data) {},
          error: (error, st) {
            showFlotingSnackBar(context, error.toString());
          },
          loading: () {});
    });
    return IconButton(
      onPressed: () async {
        String? name = await showModalBottomSheet<String?>(
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color.fromRGBO(246, 249, 252, 1),
          builder: (BuildContext context) {
            return CustomModal();
          },
        );
        var content = generateQuillContent(
          summaryData: summaryData,
          transcriptionText: transcriptionText,
        );

        var note = await ref.read(noteEditorViewmodelProvider.notifier).createNote(noteName: name ?? '', content: content, linesCount: content.length.toString());
        if (note != null) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamed(context, NoteEditorView.routeName, arguments: note);
          });
        }
      },
      icon: const Icon(Icons.edit_note),
    );
  }
}
