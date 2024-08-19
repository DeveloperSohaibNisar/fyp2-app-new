import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signin.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signup.dart';
import 'package:fyp2_clean_architecture/features/auth/view/welcome.dart';
import 'package:fyp2_clean_architecture/features/home/view/home_view.dart';
import 'package:fyp2_clean_architecture/features/pdf_summary/pdf_summary_tabs_view.dart';
import 'package:fyp2_clean_architecture/features/recorder/recorder_view.dart';
import 'package:fyp2_clean_architecture/features/recording_summary/recording_summary_tabs_view.dart';
import 'package:fyp2_clean_architecture/features/settings/settings_view.dart';
import 'package:fyp2_clean_architecture/features/splash/view/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case SettingsView.routeName:
            return const SettingsView();
          case RecorderView.routeName:
            return const RecorderView();
          case RecordTabView.routeName:
            return const RecordTabView();
          case PdfTabsView.routeName:
            return const PdfTabsView();
          case HomeView.routeName:
            return const HomeView();
          case Signup.routeName:
            return const Signup();
          case SignIn.routeName:
            return SignIn();
          case Welcome.routeName:
            return const Welcome();
          case SplashView.routeName:
            return const SplashView();
          default:
            return const SplashView();
        }
      });
}
