import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/features/home/view/tabpages/pdf/pdf_filter.dart';
import 'package:fyp2_clean_architecture/features/home/view/tabpages/pdf/pdf_list.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/pdf/pdfs_viewmodel.dart';

class PdfView extends ConsumerWidget {
  const PdfView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(pdfsViewmodelProvider, (prev, next) {
      next.when(
          data: (data) {},
          error: (error, st) {
            showFlotingSnackBar(context, error.toString());
          },
          loading: () {});
    });
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Column(
        children: [PdfFilterContainer(), Flexible(child: PdfList())],
      ),
    );
  }
}
