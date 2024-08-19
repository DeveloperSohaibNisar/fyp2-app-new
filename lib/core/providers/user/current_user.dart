import 'package:fyp2_clean_architecture/core/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/core/models/user/user_model.dart';
import 'package:fyp2_clean_architecture/core/repositories/local/user_local_repository.dart';
import 'package:fyp2_clean_architecture/core/repositories/remote/user_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  late UserLocalRepository _userLocalRepository;
  late UserRemoteRepository _userRemoteRepository;

  @override
  AsyncValue<UserModel>? build() {
    _userLocalRepository = ref.watch(userLocalRepositoryProvider);
    _userRemoteRepository = ref.watch(userRemoteRepositoryProvider);
    getUser();
    return const AsyncValue.loading();
  }

  Future<void> getUser() async {
    state = const AsyncValue.loading();
    final token = await _userLocalRepository.getToken();

    if (token != null) {
      final res = await _userRemoteRepository.getUserData(token: token);

      res.fold(
          (generalError) => state =
              AsyncValue.error(generalError, StackTrace.current), (user) async {
        state = AsyncValue.data(user.copyWith(token: token));
      });
    } else {
      state = null;
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    bool tokenRemoved = await _userLocalRepository.removeToken();
    if (tokenRemoved) {
      state = null;
    } else {
      AsyncValue.error(
          GeneralFailure(message: 'unable to logout'), StackTrace.current);
    }
  }
}
