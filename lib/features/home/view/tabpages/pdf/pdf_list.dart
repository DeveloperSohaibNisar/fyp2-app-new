import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';
import 'package:fyp2_clean_architecture/features/home/model/pdf_list_item/pdf_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/pdf/pdfs_viewmodel.dart';
import 'package:fyp2_clean_architecture/features/pdf_summary/view/pdf_summary_tabs_view.dart';

import 'package:intl/intl.dart';

class PdfList extends ConsumerStatefulWidget {
  const PdfList({super.key});

  @override
  ConsumerState<PdfList> createState() => _PdfListState();
}

class _PdfListState extends ConsumerState<PdfList> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final pdfsAsyncValue = ref.watch(pdfsViewmodelProvider);
    final pdfs = pdfsAsyncValue.value ?? [];
    final isInitialLoading = pdfsAsyncValue.isLoading && pdfs.isEmpty;
    final hasmore = ref.watch(pdfsViewmodelProvider.notifier).hasMore;
    final isFetchingMore = pdfsAsyncValue.isLoading && pdfs.isNotEmpty;

    void scrollControllerListener() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        if (!isFetchingMore && hasmore) {
          ref.read(pdfsViewmodelProvider.notifier).fetchmore();
        }
      }
    }

    _scrollController.addListener(scrollControllerListener);

    return isInitialLoading
        ? const Loader()
        : Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 8, top: 10),
            child: pdfs.isEmpty
                ? Center(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Color.fromRGBO(31, 51, 228, 1),
                            Color.fromRGBO(6, 121, 225, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        'No Pdf\'s',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount:
                        pdfs.length + (!hasmore || isFetchingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index <= pdfs.length - 1) {
                        final pdf = pdfs[index];
                        return PdfListTile(pdf: pdf);
                      } else if (isFetchingMore) {
                        return const Column(
                          children: [
                            SizedBox(height: 16),
                            Loader(),
                            SizedBox(height: 16),
                          ],
                        );
                      } else if (!hasmore) {
                        return ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              colors: [
                                Color.fromRGBO(31, 51, 228, 1),
                                Color.fromRGBO(6, 121, 225, 1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds);
                          },
                          child: const Column(
                            children: [
                              SizedBox(height: 16),
                              Text(
                                textAlign: TextAlign.center,
                                'No More Pdf\'s',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                    separatorBuilder: ((context, index) => const Divider()),
                  ),
          );
  }
}

class PdfListTile extends StatelessWidget {
  const PdfListTile({
    super.key,
    required this.pdf,
  });
  final PdfListItemModel pdf;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(.25),
                offset: const Offset(0, 4))
          ],
        ),
        child: const CircleAvatar(
          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
          child: Icon(
            Icons.description_outlined,
            weight: 100,
            grade: -25,
            color: Colors.black,
          ),
        ),
      ),
      title: Text(pdf.name),
      titleTextStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
      subtitleTextStyle: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(.51)),
      subtitle: Text(DateFormat('dd-MMM-yyyy').format(pdf.createdAt)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${pdf.numpages}-Pages'),
          const Icon(Icons.more_vert),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, PdfTabsView.routeName, arguments: pdf);
      },
    );
  }
}
