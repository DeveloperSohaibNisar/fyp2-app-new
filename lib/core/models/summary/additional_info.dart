import 'package:freezed_annotation/freezed_annotation.dart';

part 'additional_info.freezed.dart';
part 'additional_info.g.dart';

@freezed
class AdditionalInfo with _$AdditionalInfo {
  const factory AdditionalInfo({
    required List<String> mainPoints,
    required List<String> actionItems,
    required List<String> followUpQuestions,
  }) = _AdditionalInfo;

  factory AdditionalInfo.fromJson(Map<String, Object?> json) =>
      _$AdditionalInfoFromJson(json);
}
