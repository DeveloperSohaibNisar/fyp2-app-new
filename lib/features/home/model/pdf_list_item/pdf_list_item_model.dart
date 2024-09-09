import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp2_clean_architecture/core/models/summary/summary_data.dart';

part 'pdf_list_item_model.freezed.dart';
part 'pdf_list_item_model.g.dart';

@freezed
class PdfListItemModel with _$PdfListItemModel {
  const factory PdfListItemModel({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String name,
    required DateTime createdAt,
    required int numpages,
    required String pdfUrl,
    required SummaryData summaryData,
  }) = _PdfListItemModel;

  factory PdfListItemModel.fromJson(Map<String, Object?> json) =>
      _$PdfListItemModelFromJson(json);
}
