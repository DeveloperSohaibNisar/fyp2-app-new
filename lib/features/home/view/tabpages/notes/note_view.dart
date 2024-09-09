import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/note/notes_viewmodel.dart';

import 'note_filter.dart';
import 'note_list.dart';

class NoteView extends ConsumerWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(notesViewmodelProvider, (prev, next) {
      next.when(
          data: (data) {},
          error: (error, st) {
            showFlotingSnackBar(context, error.toString());
          },
          loading: () {});
    });
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [const NoteFilterContainer(), Flexible(child: NoteList())],
      ),
    );
  }
}
