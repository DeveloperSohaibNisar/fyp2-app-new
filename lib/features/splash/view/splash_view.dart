import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/failures/token_failure.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';
import 'package:fyp2_clean_architecture/features/auth/view/welcome.dart';
import 'package:fyp2_clean_architecture/features/home/view/home_view.dart';

class SplashView extends ConsumerWidget {
  static const routeName = '/Splash';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ref.watch(currentUserProvider).when(data: (data) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      });
      return const Loader();
    }, error: (error, st) {
      if (error is TokenFailure) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, Welcome.routeName);
        });
        return const Loader();
      }
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  ref.invalidate(currentUserProvider);
                },
                child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                  'Retry',
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inria Sans',
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
              error as String,
            ),
          ],
        ),
      );
    }, loading: () {
      return const Loader();
    }));
  }
}
