import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/widgets/bot_chat.dart';
import 'package:fyp2_clean_architecture/core/widgets/user_chat.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            //height: 461,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            //clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BotChat(senderMessage: "How can I help you?"),
                SizedBox(height: 16),
                UserChat(
                  senderMessage:
                      "What was the name of the father of alexender?",
                ),
                SizedBox(height: 16),
                BotChat(
                    senderMessage:
                        "The name of Alexander the Great's father was Philip II of Macedon."
                        " He was a powerful king who unified Greece and laid the groundwork for Alexander's future conquests."),
                SizedBox(height: 16),
                UserChat(
                  senderMessage:
                      "How successful was Alexander's policy of cultural fusion in unifying his diverse empire?",
                ),
                SizedBox(height: 16),
                BotChat(
                    senderMessage:
                        "The success of Alexander the Great's policy of cultural fusion in unifying his vast and diverse empire is a complex"
                        " and debated topic among historians. There is no easy answer, as the policy had both positive and negative consequences ..."),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
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
                  side: const BorderSide(width: 2, color: Color(0xFFFC8A19)),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color(0xFF848488),
                      fontSize: 14,
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    hintText: "Enter a prompt here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Icon(Icons.send)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
