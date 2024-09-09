import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/providers/file_uploading/file_uploading.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/repositories/remote/notes/notes_remote_repository.dart';
import 'package:fyp2_clean_architecture/features/note_editor/repositories/remote/note_editor/note_editor_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_editor_viewmodel.g.dart';

// Future<void> saveNote({
//   required NoteListItemModel newNote,
// }) async {
//   final link = ref.keepAlive();
//   ref.read(fileUploadingProvider.notifier).setFileUpload();
//   final res = await _noteEditorRemoteRepository.saveNote(note: newNote, token: _token);

//   res.fold((generalError) => state = AsyncValue.error(generalError.message, StackTrace.current), (data) {
//     final index = state.value!.indexWhere((note) => note.id == data.id);
//     var newState = state.value!;
//     newState.removeAt(index);
//     newState.insert(index, data);
//     state = AsyncValue.data(newState);
//   });
//   ref.read(fileUploadingProvider.notifier).unsetFileUpload();
//   link.close();
// }

@riverpod
Future<NoteListItemModel> saveNote(SaveNoteRef ref, NoteListItemModel newNote) async {
  final link = ref.keepAlive();
  final token = ref.watch(currentUserProvider.select((user) => user.value!.token!));
  ref.read(fileUploadingProvider.notifier).setFileUpload();
  final res = await ref.read(noteEditorRemoteRepositoryProvider).saveNote(note: newNote, token: token);

  return res.fold((generalError) => throw generalError.message, (data) {
    ref.read(fileUploadingProvider.notifier).unsetFileUpload();
    link.close();
    return data;
  });
}
