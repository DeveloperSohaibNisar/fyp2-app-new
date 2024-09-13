import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/providers/file_uploading/file_uploading.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButtonRemote extends ConsumerWidget {
  const DownloadButtonRemote(this.pdfUrl, this.filename, {super.key});
  final String pdfUrl, filename;

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

        final path = await getDownLoadPath();
        ref.read(fileUploadingProvider.notifier).setFileUpload();
        final file = await downloadAndSaveFile(pdfUrl.replaceAll('localhost', '10.0.2.2'), filename, path);
        ref.read(fileUploadingProvider.notifier).unsetFileUpload();
        OpenFile.open(file.path);
      },
      icon: const Icon(Icons.file_download_outlined),
    );
  }
}
