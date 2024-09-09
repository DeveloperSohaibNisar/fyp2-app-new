// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordingListItemModelImpl _$$RecordingListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordingListItemModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      audioLength:
          const DurationConverter().fromJson(json['audioLength'] as num),
      audioUrl: json['audioUrl'] as String,
      transcriptionData: TranscriptionData.fromJson(
          json['transcriptionData'] as Map<String, dynamic>),
      summaryData:
          SummaryData.fromJson(json['summaryData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecordingListItemModelImplToJson(
        _$RecordingListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'audioLength': const DurationConverter().toJson(instance.audioLength),
      'audioUrl': instance.audioUrl,
      'transcriptionData': instance.transcriptionData,
      'summaryData': instance.summaryData,
    };
