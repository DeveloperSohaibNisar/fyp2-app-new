import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:fyp2_clean_architecture/core/widgets/custom_modal.dart';
// import 'package:notespdf/modal_content.dart';
// import 'package:notespdf/saveModal.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late quill.QuillController _controller;
  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
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
        title: const Text(
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          'Record Audio',
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
              showModalBottomSheet<void>(
                context: context,
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 3,
                    maxWidth: MediaQuery.of(context).size.width - 100),
                builder: (BuildContext context) {
                  return CustomModal();
                },
              );
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
                  decoration: ShapeDecoration(
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
                    configurations: quill.QuillSimpleToolbarConfigurations(
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
                padding: const EdgeInsets.all(15.0),
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
          )),

      /*Column(
      children:[

        quill.QuillToolbar.simple(
              controller: _controller,
              configurations: quill.QuillSimpleToolbarConfigurations(
                showAlignmentButtons: true,
                showListBullets: true,
                showListNumbers: true,
                showBoldButton: true,
                showItalicButton: true,
                showUnderLineButton: true,
                showUndo: true,
                showRedo: true,
                showHeaderStyle:false,
                showBackgroundColorButton: false, // Hide background color button
                showLink: false,
                showColorButton: false,
                showCodeBlock: false,
                showClipboardPaste: false,
                showClipboardCopy: false,
                showClipboardCut: false,
                showClearFormat: false,
                color: Colors.orange,
              ),
            ),
        Container(
        padding: const EdgeInsets.all(8.0),
          child: quill.QuillEditor.basic(
            controller: _controller,
          ),
        )
      ],
    );*/
    );
  }
}
