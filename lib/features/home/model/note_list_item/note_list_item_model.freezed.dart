// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NoteListItemModel _$NoteListItemModelFromJson(Map<String, dynamic> json) {
  return _NoteListItemModel.fromJson(json);
}

/// @nodoc
mixin _$NoteListItemModel {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get uploadDate => throw _privateConstructorUsedError;
  DateTime get updateDate => throw _privateConstructorUsedError;
  int get lines => throw _privateConstructorUsedError;

  /// Serializes this NoteListItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NoteListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteListItemModelCopyWith<NoteListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteListItemModelCopyWith<$Res> {
  factory $NoteListItemModelCopyWith(
          NoteListItemModel value, $Res Function(NoteListItemModel) then) =
      _$NoteListItemModelCopyWithImpl<$Res, NoteListItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') int id,
      String title,
      DateTime uploadDate,
      DateTime updateDate,
      int lines});
}

/// @nodoc
class _$NoteListItemModelCopyWithImpl<$Res, $Val extends NoteListItemModel>
    implements $NoteListItemModelCopyWith<$Res> {
  _$NoteListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NoteListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? uploadDate = null,
    Object? updateDate = null,
    Object? lines = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateDate: null == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteListItemModelImplCopyWith<$Res>
    implements $NoteListItemModelCopyWith<$Res> {
  factory _$$NoteListItemModelImplCopyWith(_$NoteListItemModelImpl value,
          $Res Function(_$NoteListItemModelImpl) then) =
      __$$NoteListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') int id,
      String title,
      DateTime uploadDate,
      DateTime updateDate,
      int lines});
}

/// @nodoc
class __$$NoteListItemModelImplCopyWithImpl<$Res>
    extends _$NoteListItemModelCopyWithImpl<$Res, _$NoteListItemModelImpl>
    implements _$$NoteListItemModelImplCopyWith<$Res> {
  __$$NoteListItemModelImplCopyWithImpl(_$NoteListItemModelImpl _value,
      $Res Function(_$NoteListItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NoteListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? uploadDate = null,
    Object? updateDate = null,
    Object? lines = null,
  }) {
    return _then(_$NoteListItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateDate: null == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteListItemModelImpl implements _NoteListItemModel {
  const _$NoteListItemModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.uploadDate,
      required this.updateDate,
      required this.lines});

  factory _$NoteListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteListItemModelImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final int id;
  @override
  final String title;
  @override
  final DateTime uploadDate;
  @override
  final DateTime updateDate;
  @override
  final int lines;

  @override
  String toString() {
    return 'NoteListItemModel(id: $id, title: $title, uploadDate: $uploadDate, updateDate: $updateDate, lines: $lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.updateDate, updateDate) ||
                other.updateDate == updateDate) &&
            (identical(other.lines, lines) || other.lines == lines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, uploadDate, updateDate, lines);

  /// Create a copy of NoteListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteListItemModelImplCopyWith<_$NoteListItemModelImpl> get copyWith =>
      __$$NoteListItemModelImplCopyWithImpl<_$NoteListItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteListItemModelImplToJson(
      this,
    );
  }
}

abstract class _NoteListItemModel implements NoteListItemModel {
  const factory _NoteListItemModel(
      {@JsonKey(name: '_id') required final int id,
      required final String title,
      required final DateTime uploadDate,
      required final DateTime updateDate,
      required final int lines}) = _$NoteListItemModelImpl;

  factory _NoteListItemModel.fromJson(Map<String, dynamic> json) =
      _$NoteListItemModelImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  int get id;
  @override
  String get title;
  @override
  DateTime get uploadDate;
  @override
  DateTime get updateDate;
  @override
  int get lines;

  /// Create a copy of NoteListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteListItemModelImplCopyWith<_$NoteListItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
