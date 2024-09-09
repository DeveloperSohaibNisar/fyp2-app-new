import 'package:fyp2_clean_architecture/core/models/failures/form_faliure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_form_error_view_notifier.g.dart';

@Riverpod(keepAlive: true)
class SignupFormErrorViewNotifier extends _$SignupFormErrorViewNotifier {
  @override
  FormFieldFailure? build() {
    return null;
  }

  void setErrors(FormFieldFailure errors) {
    state = errors;
  }

  void unsetErrors() {
    state = null;
  }
}
