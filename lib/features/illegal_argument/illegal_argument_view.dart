import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/features/home/view/home_view.dart';

class IllegalArgumentView extends StatelessWidget {
  const IllegalArgumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Text('Illegal Argument'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeView.routeName, (_) => true);
                    },
                    child: const Text('Home'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
