import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/features/home/view/home_view.dart';

class IllegalArgumentView extends StatelessWidget {
  const IllegalArgumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 53,
                    padding: const EdgeInsets.all(3),
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, 0.00),
                        end: Alignment(-1, 0),
                        colors: [
                          Color(0xFFFC8A19),
                          Color(0xFFFD7713),
                          Color(0xFFFE600C)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeView.routeName, (_) => true);
                      },
                      child: const Text(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inria Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                        ),
                        'Home',
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                    ),
                    'Illegal Argument',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
