import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/models/note_list_item.dart';
import 'package:fyp2_clean_architecture/models/pdf_list_item.dart';
import 'package:fyp2_clean_architecture/models/recording_list_item.dart';

final appStateNotifier = ChangeNotifierProvider(
        (ref) => AppState()
);

class AppState extends ChangeNotifier {
  List<RecordingListItem> recodingdata = [
    RecordingListItem(
      id: 1,
      title: 'Recording508',
      date: DateTime(2018, 7, 29),
      length: const Duration(minutes: 4, seconds: 34),
    ),
    RecordingListItem(
      id: 2,
      title: 'Recording1',
      date: DateTime(2019, 7, 29),
      length: const Duration(minutes: 5, seconds: 34),
    ),
    RecordingListItem(
      id: 3,
      title: 'Recording423',
      date: DateTime(2018, 8, 22),
      length: const Duration(minutes: 4, seconds: 10),
    ),
    RecordingListItem(
      id: 4,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 5,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 6,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 7,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 8,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 9,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 7,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 8,
      title: 'Recording509',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
    RecordingListItem(
      id: 9,
      title: 'wow',
      date: DateTime(2018, 8, 23),
      length: const Duration(minutes: 55, seconds: 34),
    ),
  ];

  List<PdfListItem> pdfData = [
    PdfListItem(
      id: 1,
      title: 'aaaa',
      date: DateTime(2018, 7, 29),
      pages: 1,
    ),
    PdfListItem(
      id: 2,
      title: 'Pdf1',
      date: DateTime(2019, 7, 29),
      pages: 2,
    ),
    PdfListItem(
      id: 3,
      title: 'Pdf423',
      date: DateTime(2018, 8, 22),
      pages: 3,
    ),
    PdfListItem(
      id: 4,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 2,
    ),
    PdfListItem(
      id: 5,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 13,
    ),
    PdfListItem(
      id: 6,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 6,
    ),
    PdfListItem(
      id: 7,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 7,
    ),
    PdfListItem(
      id: 8,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 4,
    ),
    PdfListItem(
      id: 9,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 11,
    ),
    PdfListItem(
      id: 7,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 10,
    ),
    PdfListItem(
      id: 8,
      title: 'Pdf509',
      date: DateTime(2018, 8, 23),
      pages: 3,
    ),
    PdfListItem(
      id: 9,
      title: 'zzzz',
      date: DateTime(2018, 8, 23),
      pages: 6,
    ),
  ];

  List<NoteListItem> notesData = [
    NoteListItem(
      id: 1,
      title: 'Custom Note 1',
      uploadDate: DateTime(2018, 7, 29),
      updateDate: DateTime(2018, 7, 30),
      lines: 1,
    ),
    NoteListItem(
      id: 2,
      title: 'Custom Note 1',
      uploadDate: DateTime(2019, 9, 25),
      updateDate: DateTime(2019, 10, 26),
      lines: 2,
    ),
    NoteListItem(
      id: 3,
      title: 'Custom Note 423',
      uploadDate: DateTime(2018, 8, 22),
      updateDate: DateTime(2018, 8, 23),
      lines: 3,
    ),
    NoteListItem(
      id: 4,
      title: 'Custom Note 509',
      uploadDate: DateTime(2018, 8, 23),
      updateDate: DateTime(2018, 8, 26),
      lines: 2,
    ),
    NoteListItem(
      id: 5,
      title: 'Custom Note909',
      uploadDate: DateTime(2018, 8, 23),
      updateDate: DateTime(2018, 8, 23),
      lines: 13,
    ),
    NoteListItem(
      id: 6,
      title: 'Custom Note09',
      uploadDate: DateTime(2018, 8, 23),
      updateDate: DateTime(2018, 8, 23),
      lines: 6,
    ),
    NoteListItem(
      id: 7,
      title: 'Custom Note 509',
      uploadDate: DateTime(2018, 8, 23),
      updateDate: DateTime(2018, 8, 23),
      lines: 7,
    ),
  ];

  void sortRecodings(RecordingSortMenuItems? selectedItem) {
    switch (selectedItem) {
      case RecordingSortMenuItems.title:
        recodingdata
            .sort((first, second) => first.title.compareTo(second.title));
        break;
      case RecordingSortMenuItems.date:
        recodingdata.sort((first, second) => first.date.compareTo(second.date));
        break;
      case RecordingSortMenuItems.length:
        recodingdata
            .sort((first, second) => first.length.compareTo(second.length));
        break;
      default:
    }
    notifyListeners();
  }

  void toogleRecordingsOrder() {
    recodingdata = recodingdata.reversed.toList();
    notifyListeners();
  }

  void sortPdfs(PdfSortMenuItems? selectedItem) {
    switch (selectedItem) {
      case PdfSortMenuItems.title:
        pdfData.sort((first, second) => first.title.compareTo(second.title));
        break;
      case PdfSortMenuItems.date:
        pdfData.sort((first, second) => first.date.compareTo(second.date));
        break;
      case PdfSortMenuItems.pages:
        pdfData.sort((first, second) => first.pages.compareTo(second.pages));
        break;
      default:
    }
    notifyListeners();
  }

  void tooglePdfsOrder() {
    pdfData = pdfData.reversed.toList();
    notifyListeners();
  }

  void sortNotes(NotesSortMenuItems? selectedItem) {
    switch (selectedItem) {
      case NotesSortMenuItems.title:
        notesData.sort((first, second) => first.title.compareTo(second.title));
        break;
      case NotesSortMenuItems.creationDate:
        notesData.sort(
            (first, second) => first.uploadDate.compareTo(second.uploadDate));
        break;
      case NotesSortMenuItems.lines:
        notesData.sort((first, second) => first.lines.compareTo(second.lines));
        break;
      case NotesSortMenuItems.editDate:
        notesData.sort(
            (first, second) => first.updateDate.compareTo(second.updateDate));
        break;
      default:
    }
    notifyListeners();
  }

  void toogleNotesOrder() {
    notesData = notesData.reversed.toList();
    notifyListeners();
  }
}
