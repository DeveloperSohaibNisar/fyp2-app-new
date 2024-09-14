import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fyp2_clean_architecture/core/models/summary/summary_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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

Future<File> downloadAndSaveFile(String url, String filename, String path) async {
  // Parse the URL using Uri
  Uri uri = Uri.parse(url);

  // Get the path from the URI
  String uriPath = uri.path;

  // Extract the file extension using split and last
  String extension = uriPath.split('.').last;

  var response = await http.get(uri);
  var bytes = response.bodyBytes;
  File file = File('$path/$filename.$extension');
  await file.writeAsBytes(bytes);
  return file;
}

Future<String> getDownLoadPath() async {
  final Directory? downloadsDir = await getDownloadsDirectory();
  final filePath = Directory(downloadsDir!.absolute.path);
  if (await filePath.exists()) {
    return filePath.path;
  } else {
    await filePath.create(recursive: true);
    return filePath.path;
  }
}

pw.Document generatePdf({required SummaryData summaryData, required String? transcriptionText}) {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Title Heading
            pw.Center(
              child: pw.Text(
                summaryData.title,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  color: const PdfColor(0, 0, 0),
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            if (transcriptionText != null)
              pw.Column(children: [
                pw.Text(
                  'Transcription',
                  textAlign: pw.TextAlign.left,
                  style: pw.TextStyle(
                    color: const PdfColor(0, 0, 0),
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 16),
                pw.Text(
                  transcriptionText,
                  textAlign: pw.TextAlign.left,
                  style: const pw.TextStyle(
                    color: PdfColor(0, 0, 0),
                    fontSize: 16,
                  ),
                ),
              ]),
            pw.SizedBox(height: 16),
            // Heading
            pw.Text(
              'Summary',
              // textAlign: TextAlign.left,
              style: pw.TextStyle(
                color: const PdfColor(0, 0, 0),
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 16),
            pw.Text(
              summaryData.summary,
              textAlign: pw.TextAlign.left,
              style: const pw.TextStyle(
                color: PdfColor(0, 0, 0),
                fontSize: 16,
              ),
            ),
            pw.SizedBox(height: 16),
            // Heading
            if (summaryData.additionalInfo.mainPoints.isNotEmpty && summaryData.additionalInfo.actionItems.isNotEmpty && summaryData.additionalInfo.followUpQuestions.isNotEmpty)
              pw.Text(
                'Additional Info',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  color: const PdfColor(0, 0, 0),
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            pw.SizedBox(height: 16),
            // Sub Heading
            if (summaryData.additionalInfo.mainPoints.isNotEmpty)
              pw.Text(
                'Main Points',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  color: const PdfColor(0, 0, 0),
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            for (var item in summaryData.additionalInfo.mainPoints)
              pw.Column(
                children: [
                  pw.SizedBox(height: 8),
                  pw.Bullet(
                    text: item,
                    textAlign: pw.TextAlign.left,
                    style: const pw.TextStyle(
                      color: PdfColor(0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            pw.SizedBox(height: 16),
            // Sub Heading
            if (summaryData.additionalInfo.actionItems.isNotEmpty)
              pw.Text(
                'Potential Action Items',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  color: const PdfColor(0, 0, 0),
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            for (var item in summaryData.additionalInfo.actionItems)
              pw.Column(
                children: [
                  pw.SizedBox(height: 8),
                  pw.Bullet(
                    text: item,
                    textAlign: pw.TextAlign.left,
                    style: const pw.TextStyle(
                      color: PdfColor(0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            pw.SizedBox(height: 16),
            // Sub Heading
            if (summaryData.additionalInfo.followUpQuestions.isNotEmpty)
              pw.Text(
                'Follow-Up Questions',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  color: const PdfColor(0, 0, 0),
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            for (var item in summaryData.additionalInfo.followUpQuestions)
              pw.Column(
                children: [
                  pw.SizedBox(height: 8),
                  pw.Bullet(
                    text: item,
                    textAlign: pw.TextAlign.left,
                    style: const pw.TextStyle(
                      color: PdfColor(0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    ),
  );
  return pdf;
}

List generateQuillContent({required SummaryData summaryData, required String? transcriptionText}) {
  List quillContent = [
    {
      "insert": "${summaryData.title}\n",
      "attributes": {"bold": true, "header": 1, "align": "center"}
    },
  ];

  if (transcriptionText != null) {
    quillContent.addAll([
      {
        "insert": "Transcription\n",
        "attributes": {"bold": true, "header": 2}
      },
      {
        "insert": "$transcriptionText\n",
      },
    ]);
  }

  quillContent.addAll([
    {
      "insert": "Summary\n",
      "attributes": {"bold": true, "header": 2}
    },
    {
      "insert": "${summaryData.summary}\n",
    },
  ]);

  // Additional Info section
  if (summaryData.additionalInfo.mainPoints.isNotEmpty || summaryData.additionalInfo.actionItems.isNotEmpty || summaryData.additionalInfo.followUpQuestions.isNotEmpty) {
    quillContent.add(
      {
        "insert": "Additional Info\n",
        "attributes": {"bold": true, "header": 2}
      },
    );
  }

  // Main Points
  if (summaryData.additionalInfo.mainPoints.isNotEmpty) {
    quillContent.add(
      {
        "insert": "Main Points\n",
        "attributes": {"bold": true, "header": 3}
      },
    );

    for (var item in summaryData.additionalInfo.mainPoints) {
      quillContent.add({
        "insert": "$item\n",
        "attributes": {"list": "bullet"}
      });
    }
  }

  // Action Items
  if (summaryData.additionalInfo.actionItems.isNotEmpty) {
    quillContent.add(
      {
        "insert": "Potential Action Items\n",
        "attributes": {"bold": true, "header": 3}
      },
    );

    for (var item in summaryData.additionalInfo.actionItems) {
      quillContent.add({
        "insert": "$item\n",
        "attributes": {"list": "bullet"}
      });
    }
  }

  // Follow-Up Questions
  if (summaryData.additionalInfo.followUpQuestions.isNotEmpty) {
    quillContent.add(
      {
        "insert": "Follow-Up Questions\n",
        "attributes": {"bold": true, "header": 3}
      },
    );

    for (var item in summaryData.additionalInfo.followUpQuestions) {
      quillContent.add({
        "insert": "$item\n",
        "attributes": {"list": "bullet"}
      });
    }
  }

  return quillContent;
}

