import 'package:flutter/material.dart';

import 'recodrding_list.dart';
import 'recording_filter.dart';


class RecordingView extends StatelessWidget {
  const RecordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [RecordingFilterContainer(), Flexible(child: RecordingList())],
    );
  }
}
