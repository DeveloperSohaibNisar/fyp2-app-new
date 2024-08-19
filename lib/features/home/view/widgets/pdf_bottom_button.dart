import 'package:flutter/material.dart';

class PdfBottomButton extends StatelessWidget {
  const PdfBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () {},
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.upload_file,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
      ],
    );
  }
}
