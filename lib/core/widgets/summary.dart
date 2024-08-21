import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final String summarytext;
  const Summary({super.key, required this.summarytext});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        constraints: BoxConstraints(maxWidth: width - 24 - 100),
        height: double.infinity,
        child: Text(
          summarytext,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Calibri',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
    );
  }
}
