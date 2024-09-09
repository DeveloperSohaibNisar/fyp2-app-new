// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: json['_id'] as String,
      sourceId: json['sourceId'] as String,
      userId: json['userId'] as String,
      query: json['query'] as String,
      reply: json['reply'] as String,
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sourceId': instance.sourceId,
      'userId': instance.userId,
      'query': instance.query,
      'reply': instance.reply,
    };
