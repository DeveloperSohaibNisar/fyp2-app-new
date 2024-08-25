//import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  CustomModal({super.key});
  static const routeName = '/modal';

  // final ScrollController scrollController;
  final TextEditingController fileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: (MediaQuery.of(context).viewInsets.bottom + 40),
        top: 40,
        left: 24,
        right: 24,
      ),
      // padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                decoration: ShapeDecoration(
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              TextField(
                controller: fileNameController,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color(0xFF848488),
                      fontSize: 14,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    hintText: "File name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFFFC8A19)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xFFFC8A19)),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: const Icon(Icons.article)),
                    autofocus: true,
              ),
            ],
          ),
          const SizedBox(height: 36),
          Container(
              constraints: const BoxConstraints(minWidth: double.infinity),
              height: 53,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [
                    Color(0xFFFC8A19),
                    Color(0xFFFD7713),
                    Color(0xFFFE600C)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(fileNameController.text);
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: const Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      height: 0),
                ),
              )),
          const SizedBox(height: 28),
          Container(
              constraints: const BoxConstraints(minWidth: 345),
              height: 53,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(width: 2, color: Color(0xFFFC8A19)),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[200],
                  disabledForegroundColor:
                      const Color.fromRGBO(252, 138, 25, .8),
                  foregroundColor: const Color.fromRGBO(252, 138, 25, 1),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      height: 0),
                ),
              )),
        ],
      ),
    );
  }
}
