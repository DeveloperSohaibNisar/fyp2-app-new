import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/core/widgets/custom_modal.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/recordings/recodings_viewmodel.dart';
import 'package:fyp2_clean_architecture/features/home/view/pages/recorder/recorder_view.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingBottomButtons extends ConsumerWidget {
  const RecordingBottomButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () async {
            var microphoneStatus = await Permission.microphone.request();
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
            if (microphoneStatus == PermissionStatus.denied) {
              showSnackBar(context, 'microphone permission not granted');
              return;
            }
            final deviceInfo = await DeviceInfoPlugin().androidInfo;
            if (deviceInfo.version.sdkInt > 32) {
              var readAudioStatus = await Permission.audio.request();
              if (!context.mounted) return;

              if (readAudioStatus == PermissionStatus.permanentlyDenied) {
                var snackBar = SnackBar(
                  content: const Text(
                      'permission required to read audios from storage'),
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
              if (readAudioStatus == PermissionStatus.denied) {
                showSnackBar(context, 'permission not granted');
                return;
              }
            } else {
              var sorageStatus = await Permission.storage.request();
              if (!context.mounted) return;
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
              if (sorageStatus == PermissionStatus.denied) {
                showSnackBar(context, 'storage permission not granted');
                return;
              }
            }

            String? path =
                await Navigator.pushNamed(context, RecorderView.routeName)
                    as String?;

            if (path != null) {
              var selectedAudio = File(path);
              if (!context.mounted) return;
              String? name = await showModalBottomSheet<String?>(
                context: context,
                isScrollControlled: true,
                backgroundColor: const Color.fromRGBO(246, 249, 252, 1),
                builder: (BuildContext context) {
                  return CustomModal();
                },
              );
              ref.read(recodingsViewmodelProvider.notifier).uploadRecording(
                    selectedAudio: selectedAudio,
                    audioName: name ?? '',
                  );
            } else {
              // if (!context.mounted) return;
              // showCustomSnackBar(context, 'File path not found');
              // return;
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
            final deviceInfo = await DeviceInfoPlugin().androidInfo;
            if (deviceInfo.version.sdkInt > 32) {
              var readAudioStatus = await Permission.audio.request();
              if (!context.mounted) return;

              if (readAudioStatus == PermissionStatus.permanentlyDenied) {
                var snackBar = SnackBar(
                  content: const Text(
                      'permission required to read audios from storage'),
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
              if (readAudioStatus == PermissionStatus.denied) {
                showSnackBar(context, 'permission not granted');
                return;
              }
            } else {
              var sorageStatus = await Permission.storage.request();
              if (!context.mounted) return;
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
              if (sorageStatus == PermissionStatus.denied) {
                showSnackBar(context, 'storage permission not granted');
                return;
              }
            }

            var selectedAudio = await pickAudio();
            if (selectedAudio != null) {
              if (!context.mounted) return;
              String? name = await showModalBottomSheet<String?>(
                context: context,
                isScrollControlled: true,
                // constraints: BoxConstraints(
                //     maxHeight: MediaQuery.of(context).size.height / 3,
                //     maxWidth: MediaQuery.of(context).size.width - 100),
                backgroundColor: const Color.fromRGBO(246, 249, 252, 1),
                builder: (BuildContext context) {
                  return CustomModal();
                },
              );

              ref.read(recodingsViewmodelProvider.notifier).uploadRecording(
                    selectedAudio: selectedAudio,
                    audioName: name ?? '',
                  );
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
