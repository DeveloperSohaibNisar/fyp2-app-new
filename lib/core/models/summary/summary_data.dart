import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp2_clean_architecture/core/models/summary/additional_info.dart';

part 'summary_data.freezed.dart';
part 'summary_data.g.dart';

@freezed
class SummaryData with _$SummaryData {
  const factory SummaryData({
    required String title,
    required String summary,
    required AdditionalInfo additionalInfo,
  }) = _SummaryData;

  factory SummaryData.fromJson(Map<String, Object?> json) =>
      _$SummaryDataFromJson(json);
}
