import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp2_clean_architecture/features/home/model/transcription/transcription_data.dart';

part 'recording_list_item_model.freezed.dart';
part 'recording_list_item_model.g.dart';

@freezed
class RecordingListItemModel with _$RecordingListItemModel {
  const factory RecordingListItemModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String name,
    required DateTime uploadDate,
    required Duration audioLength,
    required String audioUrl,
    required bool isTranscriptionCreated,
    required bool isVectorDatabaseCreated,
    required bool isSummaryCreated,
    required TranscriptionData transcriptionData,
    required String summaryText,
  }) = _RecordingListItemModel;

  factory RecordingListItemModel.fromJson(Map<String, Object?> json) =>
      _$RecordingListItemModelFromJson(json);
}
