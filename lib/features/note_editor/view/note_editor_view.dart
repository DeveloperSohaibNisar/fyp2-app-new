import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/providers/file_uploading/file_uploading.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:fyp2_clean_architecture/core/providers/note_editor/note_editor_viewmodel.dart';
import 'package:flutter_quill_to_pdf/flutter_quill_to_pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/widgets.dart' as pw;

class NoteEditorView extends ConsumerStatefulWidget {
  const NoteEditorView({super.key, required this.initialNote});
  static const routeName = '/note';

  final NoteListItemModel initialNote;

  @override
  ConsumerState<NoteEditorView> createState() => _NoteEditorViewState();
}

class _NoteEditorViewState extends ConsumerState<NoteEditorView> {
  late quill.QuillController _controller;
  late NoteListItemModel _updatedNote;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController.basic();
    _controller.document = Document.fromJson(widget.initialNote.content);
    _updatedNote = widget.initialNote;
    FocusManager.instance.primaryFocus?.addListener(() {
      setState(() {
        _isKeyboardVisible = FocusManager.instance.primaryFocus?.hasFocus ?? false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _getLineCount() {
    int lineCount = 0;
    final delta = _controller.document.toDelta();
    for (final op in delta.toList()) {
      int count = op.value.split("\n").length - 1;
      lineCount += count;
    }
    return lineCount;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(noteEditorViewmodelProvider, (prev, next) {
      next.when(
          data: (data) {
            if (data != null) {
              setState(() {
                _updatedNote = data;
              });
            }
          },
          error: (error, st) {
            showFlotingSnackBar(context, error.toString());
          },
          loading: () {});
    });
    final uploadingRecording = ref.watch(fileUploadingProvider);

    return Stack(
      children: [
        PopScope<NoteListItemModel>(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, NoteListItemModel? result) {
            if (didPop) return;
            if (result != null) return;
            Navigator.pop(context, _updatedNote);
          },
          child: Scaffold(
            bottomSheet: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: quill.QuillToolbar.simple(
                controller: _controller,
                configurations: quill.QuillSimpleToolbarConfigurations(
                  multiRowsDisplay: false,
                  // toolbarSectionSpacing: 0,
                  customButtons: [
                    quill.QuillToolbarCustomButtonOptions(
                      icon: const Icon(Icons.file_download_outlined, size: 36),
                      onPressed: () async {
                        final deviceInfo = await DeviceInfoPlugin().androidInfo;
                        bool isStoragePermissionGranted;
                        if (!context.mounted) return;
                        if (deviceInfo.version.sdkInt > 32) {
                          isStoragePermissionGranted = await requestPermission(Permission.manageExternalStorage, context, 'Storage');
                        } else {
                          isStoragePermissionGranted = await requestPermission(Permission.storage, context, 'Storage');
                        }

                        if (!isStoragePermissionGranted) return;

                        ref.read(fileUploadingProvider.notifier).setFileUpload();
                        final PDFPageFormat pageFormat = PDFPageFormat.a4;
                        PDFConverter pdfConverter = PDFConverter(
                          backMatterDelta: null,
                          frontMatterDelta: null,
                          document: _controller.document.toDelta(),
                          fallbacks: [],
                          pageFormat: pageFormat,
                        );

                        final pw.Document? pdf = await pdfConverter.createDocument();
                        if (pdf == null) {
                          if (!context.mounted) return;
                          ref.read(fileUploadingProvider.notifier).unsetFileUpload();
                          showSnackBar(context, 'The file cannot be generated by an unknown error');
                          return;
                        }

                        final path = await getDownLoadPath();
                        File file = File('$path/${widget.initialNote.name}-summary.pdf');
                        await file.writeAsBytes(await pdf.save());
                        ref.read(fileUploadingProvider.notifier).unsetFileUpload();
                        OpenFile.open(file.path);
                      },
                    )
                  ],
                  buttonOptions: const quill.QuillSimpleToolbarButtonOptions(
                    base: quill.QuillToolbarBaseButtonOptions(
                      iconSize: 20,
                      iconTheme: quill.QuillIconTheme(
                        iconButtonSelectedData: quill.IconButtonData(
                          color: Colors.white,
                          highlightColor: Color(0xFFFC8A19),
                          focusColor: Color(0xFFFC8A19),
                          hoverColor: Color(0xFFFC8A19),
                          splashColor: Color(0xFFFC8A19),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Color(0xFFFC8A19)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  showFontFamily: false,
                  showLink: false,
                  showSearchButton: false,
                  showCodeBlock: false,
                  // showCenterAlignment: true
                  showAlignmentButtons: true,
                ),
              ),
            ),
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
              elevation: 2,
              leadingWidth: 95,
              leading: TextButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                )),
                onPressed: () => Navigator.of(context).pop(_updatedNote),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back, color: Color.fromRGBO(0, 122, 255, 1)),
                    SizedBox(width: 8),
                    Text(
                      style: TextStyle(
                        color: Color(0xFF007AFF),
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
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                widget.initialNote.name,
              ),
              actions: [
                TextButton(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  )),
                  onPressed: () {
                    final json = _controller.document.toDelta().toJson();
                    ref.read(noteEditorViewmodelProvider.notifier).saveNote(widget.initialNote.copyWith(content: json, linesCount: _getLineCount()));
                  },
                  child: const Text(
                    style: TextStyle(
                      color: Color(0xFF007AFF),
                      fontSize: 17,
                    ),
                    'Save',
                  ),
                ),
              ],
            ),
            body: Theme(
              data: Theme.of(context).copyWith(
                textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Color(0xFF007AFF),
                  selectionColor: Color.fromRGBO(0, 122, 255, .5),
                  selectionHandleColor: Color(0xFF007AFF),
                ),
              ),
              child: Container(
                decoration: const ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFFFC8A19), Color(0xFFFE600C)],
                  ),
                  shape: RoundedRectangleBorder(),
                ),
                child: Column(
                  children: [
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     color: Colors.white,
                    //   ),
                    //   child: quill.QuillToolbar.simple(
                    //     controller: _controller,
                    //     configurations: quill.QuillSimpleToolbarConfigurations(
                    //       multiRowsDisplay: false,
                    //       // toolbarSectionSpacing: 0,
                    //       customButtons: [
                    //         quill.QuillToolbarCustomButtonOptions(
                    //           icon: const Icon(Icons.file_download_outlined, size: 36),
                    //           onPressed: () async {
                    //             final deviceInfo = await DeviceInfoPlugin().androidInfo;
                    //             bool isStoragePermissionGranted;
                    //             if (!context.mounted) return;
                    //             if (deviceInfo.version.sdkInt > 32) {
                    //               isStoragePermissionGranted = await requestPermission(Permission.manageExternalStorage, context, 'Storage');
                    //             } else {
                    //               isStoragePermissionGranted = await requestPermission(Permission.storage, context, 'Storage');
                    //             }

                    //             ref.read(fileUploadingProvider.notifier).setFileUpload();
                    //             final PDFPageFormat pageFormat = PDFPageFormat.a4;
                    //             PDFConverter pdfConverter = PDFConverter(
                    //               backMatterDelta: null,
                    //               frontMatterDelta: null,
                    //               document: _controller.document.toDelta(),
                    //               fallbacks: [],
                    //               pageFormat: pageFormat,
                    //             );

                    //             final pw.Document? pdf = await pdfConverter.createDocument();
                    //             if (pdf == null) {
                    //               if (!context.mounted) return;
                    //               ref.read(fileUploadingProvider.notifier).unsetFileUpload();
                    //               showSnackBar(context, 'The file cannot be generated by an unknown error');
                    //               return;
                    //             }

                    //             final path = await getDownLoadPath();
                    //             File file = File('$path/${widget.initialNote.name}-summary.pdf');
                    //             await file.writeAsBytes(await pdf!.save());
                    //             ref.read(fileUploadingProvider.notifier).unsetFileUpload();
                    //             OpenFile.open(file.path);
                    //           },
                    //         )
                    //       ],
                    //       buttonOptions: const quill.QuillSimpleToolbarButtonOptions(
                    //         base: quill.QuillToolbarBaseButtonOptions(
                    //           iconSize: 20,
                    //           iconTheme: quill.QuillIconTheme(
                    //             iconButtonSelectedData: quill.IconButtonData(
                    //               color: Colors.white,
                    //               highlightColor: Color(0xFFFC8A19),
                    //               focusColor: Color(0xFFFC8A19),
                    //               hoverColor: Color(0xFFFC8A19),
                    //               splashColor: Color(0xFFFC8A19),
                    //               style: ButtonStyle(
                    //                 backgroundColor: WidgetStatePropertyAll(Color(0xFFFC8A19)),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       showFontFamily: false,
                    //       showLink: false,
                    //       showSearchButton: false,
                    //       showCodeBlock: false,
                    //       // showCenterAlignment: true
                    //       showAlignmentButtons: true,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: quill.QuillEditor.basic(
                          controller: _controller,
                        ),
                      ),
                    ),
                  ],
                ),
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
