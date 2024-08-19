import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showSnackBar(BuildContext context, String content) {
  SchedulerBinding.instance
      .addPostFrameCallback((_) => ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
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
