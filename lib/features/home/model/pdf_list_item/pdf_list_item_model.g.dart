// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfListItemModelImpl _$$PdfListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PdfListItemModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      numpages: (json['numpages'] as num).toInt(),
      pdfUrl: json['pdfUrl'] as String,
      summaryData:
          SummaryData.fromJson(json['summaryData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PdfListItemModelImplToJson(
        _$PdfListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'numpages': instance.numpages,
      'pdfUrl': instance.pdfUrl,
      'summaryData': instance.summaryData,
    };
