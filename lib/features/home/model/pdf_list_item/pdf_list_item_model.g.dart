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
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      numpages: json['numpages'] as String,
      pdfUrl: json['pdfUrl'] as String,
      isVectorDatabaseCreated: json['isVectorDatabaseCreated'] as bool,
      isSummaryCreated: json['isSummaryCreated'] as bool,
      summaryText: json['summaryText'] as String?,
    );

Map<String, dynamic> _$$PdfListItemModelImplToJson(
        _$PdfListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'numpages': instance.numpages,
      'pdfUrl': instance.pdfUrl,
      'isVectorDatabaseCreated': instance.isVectorDatabaseCreated,
      'isSummaryCreated': instance.isSummaryCreated,
      'summaryText': instance.summaryText,
    };
