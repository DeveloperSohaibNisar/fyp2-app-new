import 'package:flutter/material.dart';

class BarrierLoader extends StatelessWidget {
  const BarrierLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
