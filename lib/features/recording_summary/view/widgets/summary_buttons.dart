import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/models/summary/summary_data.dart';
import 'package:fyp2_clean_architecture/core/widgets/download_button_local.dart';
import 'package:fyp2_clean_architecture/core/widgets/edit_button.dart';

class SummaryButtons extends StatelessWidget {
  const SummaryButtons({
    super.key,
    required this.filename,
    required this.summaryData,
    required this.transcriptionText,
  });

  final String transcriptionText;
  final String filename;
  final SummaryData summaryData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        EditButton(
          summaryData: summaryData,
          transcriptionText: transcriptionText,
        ),
        DownloadButtonLocal(filename, summaryData, transcriptionText),
      ],
    );
  }
}
