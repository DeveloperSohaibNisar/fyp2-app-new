import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/providers/file_uploading/file_uploading.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:fyp2_clean_architecture/core/repositories/remote/note_editor/note_editor_remote_repository.dart';
import 'package:fyp2_clean_architecture/features/home/repositories/remote/notes/notes_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes_viewmodel.g.dart';

@riverpod
class NotesViewmodel extends _$NotesViewmodel {
  late NotesRemoteRepository _notesRemoteRepository;
  late String _token;
  List<NoteListItemModel> _data = [];
  bool _hasMore = true;
  int _page = 0;

  @override
  FutureOr<List<NoteListItemModel>> build() async {
    _notesRemoteRepository = ref.watch(notesRemoteRepositoryProvider);
    _token = ref.watch(currentUserProvider.select((user) => user.value!.token!));

    state = const AsyncValue.loading();
    var newState = await AsyncValue.guard(() => _getPaginatedNotes());
    state = newState;
    _data = newState.value ?? [];
    return newState.value ?? [];
  }

  bool get hasMore => _hasMore;

  Future<void> fetchmore() async {
    if (state.isLoading || !_hasMore) return;
    state = const AsyncValue.loading();
    var newState = await AsyncValue.guard(() async {
      var newNotes = await _getPaginatedNotes();
      return [
        ...?state.value,
        ...newNotes,
      ];
    });
    _data = newState.value ?? _data;
    state = newState;
  }

  Future<List<NoteListItemModel>> _getPaginatedNotes() async {
    final res = await _notesRemoteRepository.getPaginatedNotes(
      token: _token,
      page: _page,
    );

    return res.fold((generalError) {
      throw generalError.message;
    }, (data) {
      _hasMore = data.length == notesPerPage;
      _page++;
      return data;
    });
  }

  Future<void> createNote({
    required String noteName,
  }) async {
    final link = ref.keepAlive();
    ref.read(fileUploadingProvider.notifier).setFileUpload();
    final res = await ref.read(noteEditorRemoteRepositoryProvider).uploadNote(noteName: noteName, token: _token, content: null, linesCount: null);

    res.fold((generalError) => state = AsyncValue.error(generalError.message, StackTrace.current), (data) {
      state = AsyncValue.data([data, ...?state.value]);
      _data = state.value ?? _data;
    });
    ref.read(fileUploadingProvider.notifier).unsetFileUpload();
    link.close();
  }

  void updateNote({required NoteListItemModel newNote}) {
    var newState = state.value!;
    newState.removeWhere((note) => note.id == newNote.id);
    newState.add(newNote);
    state = AsyncValue.data(newState);
    _data = state.value ?? _data;
  }

  void sortNotes(NotesSortMenuItems? selectedItem) {
    List<NoteListItemModel> newState = state.value ?? [];
    switch (selectedItem) {
      case NotesSortMenuItems.title:
        newState.sort((first, second) => first.name.compareTo(second.name));
        break;
      case NotesSortMenuItems.creationDate:
        newState.sort((first, second) => first.createdAt.compareTo(second.createdAt));
        break;
      case NotesSortMenuItems.lines:
        newState.sort((first, second) => first.linesCount.compareTo(second.linesCount));
        break;
      case NotesSortMenuItems.editDate:
        newState.sort((first, second) => first.updatedAt.compareTo(second.updatedAt));
        break;
      default:
    }

    state = AsyncValue.data(newState);
    _data = state.value ?? _data;
  }

  void toogleNotesOrder() {
    List<NoteListItemModel> newState = state.value ?? [];
    newState = newState.reversed.toList();
    state = AsyncValue.data(newState);
    _data = state.value ?? _data;
  }

  void filterNotes({required text}) {
    List<NoteListItemModel> filteredNewState = _data.where((item) => item.name.toLowerCase().contains(text.toLowerCase())).toList();
    state = AsyncValue.data(filteredNewState);
  }
}
