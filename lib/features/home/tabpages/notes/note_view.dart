import 'package:flutter/material.dart';

import 'note_filter.dart';
import 'note_list.dart';


class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [NoteFilterContainer(), Flexible(child: NoteList())],
    );
  }
}
