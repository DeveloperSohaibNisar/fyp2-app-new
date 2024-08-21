import 'dart:developer';
import 'dart:io';

import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/repositories/remote/home_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'paginated_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  bool _hasmore = true;
  int _page = 0;
  late HomeRemoteRepository _homeRepository;
  late String token;

  @override
  Future<AsyncValue<List<RecordingListItemModel>>> build() async {
    _homeRepository = ref.watch(homeRemoteRepositoryProvider);
    token =
        ref.watch(currentUserProvider.select((user) => user!.value!.token!));

    const AsyncValue.loading();
    final newState = await AsyncValue.guard(_getPaginatedRecordings().f);

    return newState;
  }

  Future<List<RecordingListItemModel>> _getPaginatedRecordings() async {
    final res = await _homeRepository.getPaginatedRecordings(
      token: token,
      page: _page,
    );

    return res.fold((generalError) {
      throw generalError.message;
    }, (data) {
      _hasmore = data.length < 10;
      _page++;
      return data;
    });
  }
}
