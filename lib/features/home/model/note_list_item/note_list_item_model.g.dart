// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteListItemModelImpl _$$NoteListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NoteListItemModelImpl(
      id: (json['_id'] as num).toInt(),
      title: json['title'] as String,
      uploadDate: DateTime.parse(json['uploadDate'] as String),
      updateDate: DateTime.parse(json['updateDate'] as String),
      lines: (json['lines'] as num).toInt(),
    );

Map<String, dynamic> _$$NoteListItemModelImplToJson(
        _$NoteListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'uploadDate': instance.uploadDate.toIso8601String(),
      'updateDate': instance.updateDate.toIso8601String(),
      'lines': instance.lines,
    };
