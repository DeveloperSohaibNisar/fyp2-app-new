import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({super.key, required this.pdfUrl});
  final String pdfUrl;

  @override
  Widget build(BuildContext context) {
    return SfPdfViewerTheme(
      data: const SfPdfViewerThemeData(
        progressBarColor: Color(0xFF007AFF),
      ),
      child: SfPdfViewer.network(pdfUrl.replaceAll('localhost', '10.0.2.2')),
    );
  }
}
