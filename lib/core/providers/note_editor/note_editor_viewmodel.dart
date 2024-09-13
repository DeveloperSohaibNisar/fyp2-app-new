import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:fyp2_clean_architecture/core/providers/file_uploading/file_uploading.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/core/repositories/remote/note_editor/note_editor_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_editor_viewmodel.g.dart';

@riverpod
class NoteEditorViewmodel extends _$NoteEditorViewmodel {
  late String _token;
  @override
  AsyncValue<NoteListItemModel?> build() {
    _token = ref.watch(currentUserProvider.select((user) => user.value!.token!));
    return const AsyncData(null);
  }

  Future<NoteListItemModel?> createNote({
    required String noteName,
    required List content,
    required String linesCount,
  }) async {
    final link = ref.keepAlive();
    ref.read(fileUploadingProvider.notifier).setFileUpload();
    final res = await ref.read(noteEditorRemoteRepositoryProvider).uploadNote(noteName: noteName, token: _token, content: content, linesCount: linesCount);

    res.fold((generalError) => state = AsyncValue.error(generalError.message, StackTrace.current), (data) {
      state = AsyncValue.data(data);
    });
    ref.read(fileUploadingProvider.notifier).unsetFileUpload();
    link.close();
    return state.value;
  }

  Future<void> saveNote(NoteListItemModel newNote) async {
    final link = ref.keepAlive();
    ref.read(fileUploadingProvider.notifier).setFileUpload();
    final token = ref.watch(currentUserProvider.select((user) => user.value!.token!));
    final res = await ref.read(noteEditorRemoteRepositoryProvider).saveNote(note: newNote, token: token);

    return res.fold((generalError) => throw generalError.message, (data) {
      // await Future.delayed(const Duration(seconds: 1), () {});
      ref.read(fileUploadingProvider.notifier).unsetFileUpload();
      link.close();
      state = AsyncValue.data(newNote);
    });
  }
}
