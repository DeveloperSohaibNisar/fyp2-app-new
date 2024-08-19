import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_list_item_model.freezed.dart';
part 'note_list_item_model.g.dart';

@freezed
class NoteListItemModel with _$NoteListItemModel {
  const factory NoteListItemModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required int id,
    required String title,
    required DateTime uploadDate,
    required DateTime updateDate,
    required int lines,
  }) = _NoteListItemModel;

  factory NoteListItemModel.fromJson(Map<String, Object?> json) =>
      _$NoteListItemModelFromJson(json);
}
