import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:permission_handler/permission_handler.dart';

void showSnackBar(BuildContext context, String content) {
  SchedulerBinding.instance.addPostFrameCallback((_) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    ));
}

void showFlotingSnackBar(BuildContext context, String content) {
  SchedulerBinding.instance.addPostFrameCallback((_) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // margin: const EdgeInsets.only(bottom: -40),
        content: Text(content),
      ),
    ));
}

Future<File?> pickAudio() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );

    if (filePickerRes != null) {
      return File(filePickerRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickPdf() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (filePickerRes != null) {
      return File(filePickerRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

void showPermissionSnackBar(BuildContext context, String message) {
  var snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(message),
    action: SnackBarAction(
      label: 'Open Settings',
      onPressed: () => openAppSettings(),
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

Future<bool> requestPermission(Permission permission, BuildContext context, String permissionName) async {
  var status = await permission.request();
  if (!context.mounted) return false;

  if (status == PermissionStatus.permanentlyDenied) {
    showPermissionSnackBar(context, '$permissionName permission required!');
    return false;
  } else if (status == PermissionStatus.denied) {
    showFlotingSnackBar(context, '$permissionName permission not granted');
    return false;
  }

  return true;
}
