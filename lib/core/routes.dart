import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signin.dart';
import 'package:fyp2_clean_architecture/features/auth/view/signup.dart';
import 'package:fyp2_clean_architecture/features/auth/view/welcome.dart';
import 'package:fyp2_clean_architecture/features/home/model/pdf_list_item/pdf_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/view/home_view.dart';
import 'package:fyp2_clean_architecture/features/illegal_argument/view/illegal_argument_view.dart';
import 'package:fyp2_clean_architecture/features/note_editor/view/note_editor_view.dart';
import 'package:fyp2_clean_architecture/features/pdf_summary/view/pdf_summary_tabs_view.dart';
import 'package:fyp2_clean_architecture/features/recorder/recorder_view.dart';
import 'package:fyp2_clean_architecture/features/recording_summary/view/recording_summary_tabs_view.dart';
import 'package:fyp2_clean_architecture/features/settings/settings_view.dart';
import 'package:fyp2_clean_architecture/features/splash/view/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        final argument = routeSettings.arguments;
        switch (routeSettings.name) {
          case SettingsView.routeName:
            return const SettingsView();
          case RecorderView.routeName:
            return const RecorderView();
          case RecordTabView.routeName:
            if (argument is RecordingListItemModel) {
              return RecordTabView(recording: argument);
            } else {
              return const IllegalArgumentView();
            }
          case PdfTabsView.routeName:
            if (argument is PdfListItemModel) {
              return PdfTabsView(pdf: argument);
            } else {
              return const IllegalArgumentView();
            }
          case NoteEditorView.routeName:
            if (argument is NoteListItemModel) {
              return NoteEditorView(initialNote: argument);
            } else {
              return const IllegalArgumentView();
            }
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
