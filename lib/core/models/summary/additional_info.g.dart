// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdditionalInfoImpl _$$AdditionalInfoImplFromJson(Map<String, dynamic> json) =>
    _$AdditionalInfoImpl(
      mainPoints: (json['mainPoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      actionItems: (json['actionItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      followUpQuestions: (json['followUpQuestions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AdditionalInfoImplToJson(
        _$AdditionalInfoImpl instance) =>
    <String, dynamic>{
      'mainPoints': instance.mainPoints,
      'actionItems': instance.actionItems,
      'followUpQuestions': instance.followUpQuestions,
    };
