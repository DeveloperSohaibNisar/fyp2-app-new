import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/widgets/custom_modal.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/note/notes_viewmodel.dart';

class NoteBottomButton extends ConsumerWidget {
  const NoteBottomButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () async {
            if (!context.mounted) return;
            String? name = await showModalBottomSheet<String?>(
              context: context,
              isScrollControlled: true,
              backgroundColor: const Color.fromRGBO(246, 249, 252, 1),
              builder: (BuildContext context) {
                return CustomModal();
              },
            );
            ref.read(notesViewmodelProvider.notifier).createNote(noteName: name ?? '');
          },
          iconSize: 45,
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.add,
            shadows: <Shadow>[Shadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 4, offset: Offset(0, 4))],
          ),
        ),
      ],
    );
  }
}
