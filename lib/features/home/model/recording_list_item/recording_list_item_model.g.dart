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
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      audioLength: Duration(microseconds: (json['audioLength'] as num).toInt()),
      audioUrl: json['audioUrl'] as String,
      isTranscriptionCreated: json['isTranscriptionCreated'] as bool,
      isVectorDatabaseCreated: json['isVectorDatabaseCreated'] as bool,
      isSummaryCreated: json['isSummaryCreated'] as bool,
      transcriptionData: TranscriptionData.fromJson(
          json['transcriptionData'] as Map<String, dynamic>),
      summaryText: json['summaryText'] as String?,
    );

Map<String, dynamic> _$$RecordingListItemModelImplToJson(
        _$RecordingListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'audioLength': instance.audioLength.inMicroseconds,
      'audioUrl': instance.audioUrl,
      'isTranscriptionCreated': instance.isTranscriptionCreated,
      'isVectorDatabaseCreated': instance.isVectorDatabaseCreated,
      'isSummaryCreated': instance.isSummaryCreated,
      'transcriptionData': instance.transcriptionData,
      'summaryText': instance.summaryText,
    };
