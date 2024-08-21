// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription_chunk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranscriptionChunkImpl _$$TranscriptionChunkImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscriptionChunkImpl(
      id: json['_id'] as String,
      text: json['text'] as String,
      timestamp: (json['timestamp'] as List<dynamic>)
          .map(const DurationConverter().fromJson)
          .toList(),
    );

Map<String, dynamic> _$$TranscriptionChunkImplToJson(
        _$TranscriptionChunkImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'text': instance.text,
      'timestamp':
          instance.timestamp.map(const DurationConverter().toJson).toList(),
    };
