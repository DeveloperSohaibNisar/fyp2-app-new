
import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/widgets/download_button_remote.dart';

class PdfButtons extends StatelessWidget {
  const PdfButtons({super.key, required this.pdfUrl, required this.filename});
  final String pdfUrl;
  final String filename;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DownloadButtonRemote(pdfUrl, filename),
      ],
    );
  }
}
