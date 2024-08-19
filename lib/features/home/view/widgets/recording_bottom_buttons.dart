import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/features/recorder/recorder_view.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingBottomButtons extends StatelessWidget {
  const RecordingBottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () async {
            var microphoneStatus = await Permission.microphone.request();
            var sorageStatus = await Permission.storage.request();
            if (!context.mounted) return;

            if (microphoneStatus == PermissionStatus.permanentlyDenied) {
              var snackBar = SnackBar(
                content: const Text('microphone permission required!'),
                action: SnackBarAction(
                  label: 'Open Settings',
                  onPressed: () => openAppSettings(),
                ),
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              return;
            }
            if (sorageStatus == PermissionStatus.permanentlyDenied) {
              var snackBar = SnackBar(
                content: const Text('storage permission required!'),
                action: SnackBarAction(
                  label: 'Open Settings',
                  onPressed: () => openAppSettings(),
                ),
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
              return;
            }
            if (microphoneStatus == PermissionStatus.denied) {
              showSnackBar(context, 'microphone permission not granted');
              return;
            }
            if (sorageStatus == PermissionStatus.denied) {
              showSnackBar(context, 'storage permission not granted');
              return;
            }

            if (microphoneStatus == PermissionStatus.granted &&
                sorageStatus == PermissionStatus.granted) {
              Navigator.restorablePushNamed(context, RecorderView.routeName);
            }
          },
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.mic,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
        const SizedBox(width: 40),
        IconButton.filledTonal(
          onPressed: () async {
            var picked = await FilePicker.platform.pickFiles();
            if (picked != null) {
              if (kDebugMode) {
                print(picked.files.first.name);
              }
            }
          },
          iconSize: 45,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.audio_file,
            shadows: <Shadow>[
              Shadow(
                  color: Color.fromRGBO(0, 0, 0, .25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ],
          ),
        ),
      ],
    );
  }
}
