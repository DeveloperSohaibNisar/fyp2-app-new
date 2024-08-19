// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfListItemModelImpl _$$PdfListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PdfListItemModelImpl(
      id: (json['_id'] as num).toInt(),
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      pages: (json['pages'] as num).toInt(),
    );

Map<String, dynamic> _$$PdfListItemModelImplToJson(
        _$PdfListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'pages': instance.pages,
    };
