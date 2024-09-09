import 'package:fyp2_clean_architecture/core/models/failures/token_failure.dart';
import 'package:fyp2_clean_architecture/core/models/user/user_model.dart';
import 'package:fyp2_clean_architecture/core/repositories/local/user_local_repository.dart';
import 'package:fyp2_clean_architecture/core/repositories/remote/user/user_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  late UserLocalRepository _userLocalRepository;

  @override
  Future<UserModel> build() async {
    _userLocalRepository = ref.watch(userLocalRepositoryProvider);

    state = const AsyncValue.loading();
    final token = await ref.watch(userLocalRepositoryProvider).getToken();

    // await Future.delayed(const Duration(seconds: 5), () {});

    if (token != null) {
      final res = await ref
          .watch(userRemoteRepositoryProvider)
          .getUserData(token: token);

      return res.fold(
          (generalError) => throw generalError.message, (user) => user);
    } else {
      throw TokenFailure(
          message: 'Something went wrong authentication token not found');
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    // await Future.delayed(const Duration(seconds: 5), () {});
    bool tokenRemoved = await _userLocalRepository.removeToken();
    if (tokenRemoved) {
      ref.invalidateSelf();
    } else {
      AsyncValue.error('Unable to logout', StackTrace.current);
    }
  }
}
