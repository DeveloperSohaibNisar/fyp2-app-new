import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/features/home/tabpages/pdf/pdf_filter.dart';
import 'package:fyp2_clean_architecture/features/home/tabpages/pdf/pdf_list.dart';


class PdfView extends StatelessWidget {
  const PdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [PdfFilterContainer(), Flexible(child: PdfList())],
    );
  }
}
