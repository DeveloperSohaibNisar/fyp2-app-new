import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/core/widgets/custom_modal.dart';
import 'package:fyp2_clean_architecture/features/home/viewmodel/pdf/pdfs_viewmodel.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfBottomButton extends ConsumerWidget {
  const PdfBottomButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filledTonal(
          onPressed: () async {
            // Check Storage Permissions based on SDK version
            final deviceInfo = await DeviceInfoPlugin().androidInfo;
            if (!context.mounted) return;

            bool isStoragePermissionGranted;
            if (deviceInfo.version.sdkInt > 32) {
              isStoragePermissionGranted = await requestPermission(Permission.manageExternalStorage, context, 'Storage');
            } else {
              isStoragePermissionGranted = await requestPermission(Permission.storage, context, 'Storage');
            }

            if (!isStoragePermissionGranted) return;

            var selectedPdf = await pickPdf();
            if (selectedPdf != null) {
              if (!context.mounted) return;
              String? name = await showModalBottomSheet<String?>(
                context: context,
                isScrollControlled: true,
                backgroundColor: const Color.fromRGBO(246, 249, 252, 1),
                builder: (BuildContext context) {
                  return CustomModal();
                },
              );

              ref.read(pdfsViewmodelProvider.notifier).uploadPdf(
                    selectedPdf: selectedPdf,
                    pdfName: name ?? '',
                  );
            }
          },
          iconSize: 45,
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.black.withOpacity(.1))),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          icon: const Icon(
            Icons.upload_file,
            shadows: <Shadow>[Shadow(color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 4, offset: Offset(0, 4))],
          ),
        ),
      ],
    );
  }
}
