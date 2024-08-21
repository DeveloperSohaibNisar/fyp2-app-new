import 'dart:developer';
import 'dart:io';

import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/repositories/remote/home_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late HomeRemoteRepository _homeRepository;
  late String token;

  @override
  AsyncValue? build() {
    _homeRepository = ref.watch(homeRemoteRepositoryProvider);
    token =
        ref.watch(currentUserProvider.select((user) => user!.value!.token!));
    return null;
  }

  Future<void> uploadRecording({
    required File selectedAudio,
    required String audioName,
  }) async {
    state = const AsyncValue.loading();
    final res = await _homeRepository.uploadRecording(
        selectedAudio: selectedAudio, audioName: audioName, token: token);

    res.fold(
        (generalError) => state =
            AsyncValue.error(generalError.message, StackTrace.current), (data) {
      // re evalueat
      state = const AsyncValue.data(null);
    });
  }
}
