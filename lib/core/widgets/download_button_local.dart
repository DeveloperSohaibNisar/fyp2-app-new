import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/models/summary/summary_data.dart';
import 'package:fyp2_clean_architecture/core/providers/file_uploading/file_uploading.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButtonLocal extends ConsumerWidget {
  const DownloadButtonLocal(this.filename, this.summaryData, this.transcriptionText, {super.key});
  final String filename;
  final SummaryData summaryData;
  final String? transcriptionText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final deviceInfo = await DeviceInfoPlugin().androidInfo;
        bool isStoragePermissionGranted;
        if (!context.mounted) return;
        if (deviceInfo.version.sdkInt > 32) {
          isStoragePermissionGranted = await requestPermission(Permission.manageExternalStorage, context, 'Storage');
        } else {
          isStoragePermissionGranted = await requestPermission(Permission.storage, context, 'Storage');
        }

        if (!isStoragePermissionGranted) return;

        ref.read(fileUploadingProvider.notifier).setFileUpload();
        final pdf = generatePdf(
          summaryData: summaryData,
          transcriptionText: transcriptionText,
        );

        final path = await getDownLoadPath();
        File file = File('$path/$filename-summary.pdf');
        await file.writeAsBytes(await pdf.save());
        ref.read(fileUploadingProvider.notifier).unsetFileUpload();
        OpenFile.open(file.path);
      },
      icon: const Icon(Icons.file_download_outlined),
    );
  }
}
