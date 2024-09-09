import 'package:flutter/material.dart';

class BotChatCard extends StatelessWidget {
  final String? text;

  const BotChatCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 16,
        foregroundImage: AssetImage('assets/images/app_logo_colored.png'),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: const Color(0xFFF6F9FC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: text != null
              ? Text(text!)
              : const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(254, 96, 12, .8),
                  ),
                ),
        ),
      ),
      titleTextStyle: const TextStyle(
          color: Colors.black, fontFamily: 'Inria Sans', fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      horizontalTitleGap: 8,
      titleAlignment: ListTileTitleAlignment.top,
    );
  }
}
