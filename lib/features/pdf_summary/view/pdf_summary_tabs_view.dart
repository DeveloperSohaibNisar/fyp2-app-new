import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/providers/file_uploading/file_uploading.dart';
import 'package:fyp2_clean_architecture/core/widgets/summary_container.dart';
import 'package:fyp2_clean_architecture/core/widgets/chat/chat_view.dart';
import 'package:fyp2_clean_architecture/features/home/model/pdf_list_item/pdf_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/pdf_summary/view/pdf_viewer.dart';
import 'package:fyp2_clean_architecture/features/pdf_summary/view/widgets/pdf_buttons.dart';
import 'package:fyp2_clean_architecture/features/pdf_summary/view/widgets/summary_buttons.dart';

class PdfTabsView extends ConsumerStatefulWidget {
  const PdfTabsView({super.key, required this.pdf});
  static const routeName = '/PdfTabView';
  final PdfListItemModel pdf;

  @override
  ConsumerState<PdfTabsView> createState() => _PdfTabsViewState();
}

class _PdfTabsViewState extends ConsumerState<PdfTabsView> {
  late Widget? _tabBottomButtons = PdfButtons(
    pdfUrl: widget.pdf.pdfUrl,
    filename: widget.pdf.name,
  );

  _handleTabSelection(currentIndex) {
    setState(() {
      switch (currentIndex) {
        case 0:
          setState(() {
            _tabBottomButtons = PdfButtons(pdfUrl: widget.pdf.pdfUrl, filename: widget.pdf.name);
          });
        case 1:
          setState(() {
            _tabBottomButtons = SummaryButtons(
              summaryData: widget.pdf.summaryData,
              filename: widget.pdf.name,
            );
          });
        case 2:
          setState(() {
            _tabBottomButtons = null;
          });
          break;
        default:
          setState(() {
            _tabBottomButtons = null;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final uploadingRecording = ref.watch(fileUploadingProvider);
    return Stack(
      children: [
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
              elevation: 4,
              surfaceTintColor: Colors.grey,
              leadingWidth: 95,
              leading: TextButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                )),
                onPressed: () => Navigator.of(context).pop(),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back, color: Color.fromRGBO(0, 122, 255, 1)),
                    SizedBox(width: 8),
                    Text(
                      style: TextStyle(
                        color: Color.fromRGBO(0, 122, 255, 1),
                        fontSize: 17,
                      ),
                      'Back',
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              title: Text(
                style: const TextStyle(
                    // fontSize: 17,
                    // fontWeight: FontWeight.bold,
                    ),
                widget.pdf.name,
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(140),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _tabBottomButtons != null ? const SizedBox(height: 16) : const SizedBox(height: 36),
                      DecoratedBox(
                        decoration: BoxDecoration(border: Border.all(color: const Color.fromRGBO(222, 229, 238, 1)), borderRadius: BorderRadius.circular(30)),
                        child: TabBar(
                          dividerHeight: 0,
                          indicator: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(252, 138, 25, 1),
                                Color.fromRGBO(253, 119, 19, 1),
                                Color.fromRGBO(254, 96, 12, 1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          labelStyle: const TextStyle(fontSize: 13),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          splashBorderRadius: BorderRadius.circular(30),
                          padding: const EdgeInsets.all(8),
                          tabs: const [
                            Tab(text: 'PDF Viewer'),
                            Tab(text: 'Summary'),
                            Tab(text: 'Chat'),
                          ],
                        ),
                      ),
                      _tabBottomButtons != null ? const SizedBox(height: 4) : const SizedBox(height: 36),
                      Builder(
                        builder: (context) {
                          final TabController tabController = DefaultTabController.of(context);
                          tabController.addListener(() {
                            if (!tabController.indexIsChanging) {
                              _handleTabSelection(tabController.index);
                            }
                          });
                          return AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: _tabBottomButtons ?? const SizedBox(),
                          );
                        },
                      ),
                      _tabBottomButtons != null ? const SizedBox(height: 4) : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(color: Color.fromRGBO(246, 249, 252, 1)),
              padding: const EdgeInsets.only(top: 16),
              child: TabBarView(
                children: [
                  PdfViewer(pdfUrl: widget.pdf.pdfUrl),
                  SummaryContainer(summaryData: widget.pdf.summaryData),
                  ChatView(
                    additionalInfo: widget.pdf.summaryData.additionalInfo,
                    sourceId: widget.pdf.id,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (uploadingRecording)
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (uploadingRecording)
          const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(254, 96, 12, 1),
            ),
          )
      ],
    );
  }
}
