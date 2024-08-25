import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  final String summarytext;
  const Summary({super.key, required this.summarytext});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
    );
  }
}
