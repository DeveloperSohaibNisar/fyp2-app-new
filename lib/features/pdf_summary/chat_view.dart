import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/widgets/bot_chat.dart';

import '../../core/widgets/user_chat.dart';
class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/25x25"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        Container(
          //width: 393,
          height: 16,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFF6F9FC)),
        ),
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
                senderMessage: "What was the name of the father of alexender?",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 260,
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFF6F9FC),
                    hintText: "Write message...",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(
                side: BorderSide.none,
                eccentricity: 1.0,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
