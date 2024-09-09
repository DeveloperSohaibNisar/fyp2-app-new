// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteListItemModelImpl _$$NoteListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NoteListItemModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      linesCount: (json['linesCount'] as num).toInt(),
      content: json['content'] as List<dynamic>,
    );

Map<String, dynamic> _$$NoteListItemModelImplToJson(
        _$NoteListItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'linesCount': instance.linesCount,
      'content': instance.content,
    };
