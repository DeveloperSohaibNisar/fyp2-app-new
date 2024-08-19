import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/features/auth/model/token_model.dart';
import 'package:fyp2_clean_architecture/core/repositories/local/user_local_repository.dart';
import 'package:fyp2_clean_architecture/features/auth/repositories/remote/auth_remote_repository.dart';
import 'package:fyp2_clean_architecture/features/auth/viewmodel/form_error/login/login_form_error_view_notifier.dart';
import 'package:fyp2_clean_architecture/features/auth/viewmodel/form_error/signup/signup_form_error_view_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;
  late UserLocalRepository _userLocalRepository;
  late LoginFormErrorViewNotifier _loginFormErrorViewNotifier;
  late SignupFormErrorViewNotifier _signupFormErrorViewNotifier;

  @override
  AsyncValue<TokenModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _userLocalRepository = ref.watch(userLocalRepositoryProvider);
    _loginFormErrorViewNotifier =
        ref.watch(loginFormErrorViewNotifierProvider.notifier);
    _signupFormErrorViewNotifier =
        ref.watch(signupFormErrorViewNotifierProvider.notifier);
    return null;
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.signup(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    res.fold((formFaiure) {
      formFaiure.failure.fold((fieldErrors) {
        _signupFormErrorViewNotifier.setErrors(fieldErrors);
        state = null;
      }, (generalError) {
        state = AsyncValue.error(generalError, StackTrace.current);
      });
    }, (token) async {
      await _userLocalRepository.setToken(token);
      ref.read(currentUserProvider.notifier).getUser();
      state = AsyncValue.data(TokenModel(token: token));
    });
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final res = await _authRemoteRepository.login(
      email: email,
      password: password,
    );

    res.fold((formFaiure) {
      formFaiure.failure.fold((fieldErrors) {
        _loginFormErrorViewNotifier.setErrors(fieldErrors);
        state = null;
      }, (generalError) {
        state = AsyncValue.error(generalError, StackTrace.current);
      });
    }, (token) async {
      await _userLocalRepository.setToken(token);
      ref.read(currentUserProvider.notifier).getUser();
      state = AsyncValue.data(TokenModel(token: token));
    });
  }

  // Future<void> getUser() async {
  //   state = const AsyncValue.loading();
  //   final token = await _userLocalRepository.getToken();

  //   if (token != null) {
  //     final res = await _authRemoteRepository.getUserData(token: token);

  //     res.fold(
  //         (generalError) => state = AsyncValue.error(generalError, StackTrace.current),
  //         (user) async {
  //       _currentUserNotifier.addUser(user.copyWith(token: token));
  //     });
  //   } else {
  //     state = AsyncValue.error(
  //         GeneralFailure(message: 'authentication failed'), StackTrace.current);
  //   }
  // }
}
