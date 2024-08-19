import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String name,
    required String email,
    required String profilePictureUrl,
    required String ? token,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
