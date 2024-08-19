// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordingListItemModelImpl _$$RecordingListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordingListItemModelImpl(
      id: (json['_id'] as num).toInt(),
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      length: Duration(microseconds: (json['length'] as num).toInt()),
    );

Map<String, dynamic> _$$RecordingListItemModelImplToJson(
        _$RecordingListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'length': instance.length.inMicroseconds,
    };
