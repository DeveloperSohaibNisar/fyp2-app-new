import 'package:freezed_annotation/freezed_annotation.dart';

part 'recording_list_item_model.freezed.dart';
part 'recording_list_item_model.g.dart';

@freezed
class RecordingListItemModel with _$RecordingListItemModel {
  const factory RecordingListItemModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required int id,
    required String title,
    required DateTime date,
    required Duration length,
  }) = _RecordingListItemModel;

  factory RecordingListItemModel.fromJson(Map<String, Object?> json) =>
      _$RecordingListItemModelFromJson(json);
}
