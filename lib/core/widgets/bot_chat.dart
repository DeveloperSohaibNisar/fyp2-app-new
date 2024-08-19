import 'package:flutter/material.dart';

class BotChat extends StatelessWidget {
  final String senderMessage;

  const BotChat({super.key, required this.senderMessage});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://www.google.com/imgres?q=bot%20logo&imgurl=https%3A%2F%2Fcdn.dribbble.com%2Fuserupload%2F13167767%2Ffile%2Foriginal-0b388d7870eb7d98416f88bb4c723273.jpg%3Fresize%3D400x0&imgrefurl=https%3A%2F%2Fdribbble.com%2Ftags%2Fbot-logo&docid=UiPWoMTFwa6A6M&tbnid=Uyu8-eyQsJSy1M&vet=12ahUKEwj_9_q47deFAxWo7QIHHbuzMa0QM3oECH0QAA..i&w=400&h=300&hcb=2&ved=2ahUKEwj_9_q47deFAxWo7QIHHbuzMa0QM3oECH0QAA"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          constraints: BoxConstraints(maxWidth: width - 24 - 100),
          decoration: ShapeDecoration(
            color: const Color(0xFFF6F9FC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(),
            child: Text(
              senderMessage,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Inria Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
