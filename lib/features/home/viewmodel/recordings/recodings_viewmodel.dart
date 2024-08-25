import 'dart:io';

import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/repositories/remote/recordings/recordings_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recodings_viewmodel.g.dart';

@riverpod
class RecodingsViewmodel extends _$RecodingsViewmodel {
  late RecordingsRemoteRepository _recordingsRepository;
  late String _token;
  bool _hasMore = true;
  int _page = 0;

  @override
  FutureOr<List<RecordingListItemModel>> build() async {
    _recordingsRepository = ref.watch(recordingsRemoteRepositoryProvider);
    _token =
        ref.watch(currentUserProvider.select((user) => user.value!.token!));

    state = const AsyncValue.loading();
    var newState = await AsyncValue.guard(() => _getPaginatedRecordings());
    state = newState;
    return newState.value ?? [];
  }

  bool get hasMore => _hasMore;

  Future<void> fetchmore() async {
    if (state.isLoading || !_hasMore) return;
    state = const AsyncValue.loading();
    var newState = await AsyncValue.guard(() async {
      var newRecordings = await _getPaginatedRecordings();
      return [
        ...?state.value,
        ...newRecordings,
      ];
    });
    state = newState;
  }

  Future<List<RecordingListItemModel>> _getPaginatedRecordings() async {
    final res = await _recordingsRepository.getPaginatedRecordings(
      token: _token,
      page: _page,
    );

    return res.fold((generalError) {
      throw generalError.message;
    }, (data) {
      _hasMore = data.length == recordingsPerPage;
      _page++;
      return data;
    });
  }

  Future<void> uploadRecording({
    required File selectedAudio,
    required String audioName,
  }) async {
    state = const AsyncValue.loading();
    final res = await _recordingsRepository.uploadRecording(
        selectedAudio: selectedAudio, audioName: audioName, token: _token);

    res.fold(
        (generalError) => state =
            AsyncValue.error(generalError.message, StackTrace.current), (data) {
      state = AsyncValue.data([data, ...?state.value]);
    });
  }

  void sortRecodings(RecordingSortMenuItems? selectedItem) {
    List<RecordingListItemModel> newState = state.value ?? [];
    switch (selectedItem) {
      case RecordingSortMenuItems.title:
        newState.sort((first, second) => first.name.compareTo(second.name));
        break;
      case RecordingSortMenuItems.date:
        newState.sort(
            (first, second) => first.uploadDate.compareTo(second.uploadDate));
        break;
      case RecordingSortMenuItems.length:
        newState.sort(
            (first, second) => first.audioLength.compareTo(second.audioLength));
        break;
      default:
    }
    state = AsyncValue.data(newState);
  }

  void toogleRecordingsOrder() {
    List<RecordingListItemModel> newState = state.value ?? [];
    newState = newState.reversed.toList();
    state = AsyncValue.data(newState);
  }
}
