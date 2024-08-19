import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';
import 'package:fyp2_clean_architecture/features/auth/view/welcome.dart';
import 'package:fyp2_clean_architecture/features/home/view/home_view.dart';

class SplashView extends ConsumerWidget {
  static const routeName = '/Splash';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserProviderValue = ref.watch(currentUserProvider);
    if (currentUserProviderValue != null) {
      currentUserProviderValue.when(
          data: (data) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, HomeView.routeName);
            });
          },
          error: (error, st) {
            GeneralFailure generalError = error as GeneralFailure;
            showSnackBar(context, generalError.message);
          },
          loading: () {});
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, Welcome.routeName);
      });
    }

    // if (!isLoading && currentUserProviderValue == null) {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     Navigator.pushReplacementNamed(context, Welcome.routeName);
    //   });
    // }

    return const Scaffold(
      body: Loader(),
    );
  }
}
