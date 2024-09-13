import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/widgets/download_button_remote.dart';

class TranscriptionButtons extends StatelessWidget {
  const TranscriptionButtons({super.key, required this.audioUrl, required this.filename});
  final String audioUrl;
  final String filename;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DownloadButtonRemote(audioUrl, filename),
      ],
    );
  }
}
