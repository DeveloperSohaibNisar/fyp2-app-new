import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_list_item_model.freezed.dart';
part 'pdf_list_item_model.g.dart';

@freezed
class PdfListItemModel with _$PdfListItemModel {
  const factory PdfListItemModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required int id,
    required String title,
    required DateTime date,
    required int pages,
  }) = _PdfListItemModel;

  factory PdfListItemModel.fromJson(Map<String, Object?> json) =>
      _$PdfListItemModelFromJson(json);
}
