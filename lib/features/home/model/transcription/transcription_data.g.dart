// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranscriptionDataImpl _$$TranscriptionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TranscriptionDataImpl(
      text: json['text'] as String,
      chunks: (json['chunks'] as List<dynamic>)
          .map((e) => TranscriptionChunk.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TranscriptionDataImplToJson(
        _$TranscriptionDataImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'chunks': instance.chunks,
    };
