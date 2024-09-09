import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';

class NoteArgument {
  final NoteListItemModel note;
  final Future<void> Function(NoteListItemModel) saveNote;

  NoteArgument({required this.note, required this.saveNote});
}
