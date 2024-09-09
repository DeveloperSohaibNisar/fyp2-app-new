import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';

class UserChatCard extends ConsumerWidget {
  final String text;

  const UserChatCard({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilePictureUrl =
        ref.watch(currentUserProvider).value!.profilePictureUrl;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 16,
        foregroundImage: NetworkImage(
            profilePictureUrl.replaceAll('localhost', '10.0.2.2')),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFFC8A19), Color(0xFFFD7713), Color(0xFFFE600C)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(text),
        ),
      ),
      titleTextStyle: const TextStyle(
          color: Colors.white, fontFamily: 'Inria Sans', fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      horizontalTitleGap: 8,
      titleAlignment: ListTileTitleAlignment.top,
    );
  }
}
