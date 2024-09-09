// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryDataImpl _$$SummaryDataImplFromJson(Map<String, dynamic> json) =>
    _$SummaryDataImpl(
      title: json['title'] as String,
      summary: json['summary'] as String,
      additionalInfo: AdditionalInfo.fromJson(
          json['additionalInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SummaryDataImplToJson(_$SummaryDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'additionalInfo': instance.additionalInfo,
    };
