import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fyp2_clean_architecture/core/widgets/custom_modal.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
// import 'package:notespdf/modal_content.dart';
// import 'package:notespdf/saveModal.dart';

class NoteEditorView extends StatefulWidget {
  const NoteEditorView({super.key, required this.noteInitial, required this.saveNote});
  static const routeName = '/note';

  final NoteListItemModel noteInitial;
  // NoteListItemModel note;
  final Future<void> Function(NoteListItemModel) saveNote;

  @override
  State<NoteEditorView> createState() => _NoteEditorViewState();
}

class _NoteEditorViewState extends State<NoteEditorView> {
  late quill.QuillController _controller;
  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController.basic();
    _controller.document = Document.fromJson(widget.note.content);
    // note=Inital
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          widget.note.name,
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
              widget.saveNote(widget.note.copyWith(content: json));
            },
            child: const Text(
              style: TextStyle(
                color: Color.fromRGBO(0, 122, 255, 1),
                fontSize: 17,
              ),
              'Save',
            ),
          ),
        ],
      ),
      body: Container(
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
            ExpansionTile(
              showTrailingIcon: false,
              backgroundColor: Colors.transparent,
              title: Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  )),
                ),
                child: quill.QuillToolbar.simple(
                  controller: _controller,
                  configurations: const quill.QuillSimpleToolbarConfigurations(
                    showBoldButton: true,
                    showItalicButton: true,
                    showUnderLineButton: true,
                    showUndo: true,
                    showRedo: true,
                    showListCheck: false,
                    showQuote: false,
                    showIndent: false,
                    showListBullets: false,
                    showListNumbers: false,
                    showAlignmentButtons: false,
                    showHeaderStyle: false,
                    showBackgroundColorButton: false,
                    showLink: false,
                    showColorButton: false,
                    showInlineCode: false,
                    showSubscript: false,
                    showSuperscript: false,
                    showCodeBlock: false,
                    showClipboardPaste: false,
                    showClipboardCopy: false,
                    showClipboardCut: false,
                    showClearFormat: false,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: [Color(0x9fe6e6e6), Color(0x9fc4c4c4)],
                        stops: [0.25, 0.75],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: quill.QuillEditor.basic(controller: _controller),
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
