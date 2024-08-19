import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  final String senderMessage;

  const UserChat({super.key, required this.senderMessage});

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
                  "https://www.google.com/imgres?q=user%20logo&imgurl=https%3A%2F%2Fbanner2.cleanpng.com%2F20180329%2Fzue%2Fkisspng-computer-icons-user-profile-person-5abd85306ff7f7.0592226715223698404586.jpg&imgrefurl=https%3A%2F%2Fwww.cleanpng.com%2Fpng-computer-icons-user-profile-person-730537%2F&docid=K-78BsERAXwWhM&tbnid=04b7qoBnXRH0WM&vet=12ahUKEwiW6P6H7deFAxV83QIHHZwSDukQM3oECHwQAA..i&w=900&h=900&hcb=2&ved=2ahUKEwiW6P6H7deFAxV83QIHHZwSDukQM3oECHwQAA"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          constraints: BoxConstraints(maxWidth: width - 24 - 100),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(1.00, 0.00),
              end: Alignment(-1, 0),
              colors: [Color(0xFFFC8A19), Color(0xFFFD7713), Color(0xFFFE600C)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
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
      ],
    );
  }
}
