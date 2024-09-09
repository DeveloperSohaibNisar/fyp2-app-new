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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get linesCount => throw _privateConstructorUsedError;
  List<dynamic> get content => throw _privateConstructorUsedError;

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
      {@JsonKey(name: '_id') String id,
      String name,
      DateTime createdAt,
      DateTime updatedAt,
      int linesCount,
      List<dynamic> content});
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
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? linesCount = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      linesCount: null == linesCount
          ? _value.linesCount
          : linesCount // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      {@JsonKey(name: '_id') String id,
      String name,
      DateTime createdAt,
      DateTime updatedAt,
      int linesCount,
      List<dynamic> content});
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
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? linesCount = null,
    Object? content = null,
  }) {
    return _then(_$NoteListItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      linesCount: null == linesCount
          ? _value.linesCount
          : linesCount // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteListItemModelImpl implements _NoteListItemModel {
  const _$NoteListItemModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt,
      required this.linesCount,
      required final List<dynamic> content})
      : _content = content;

  factory _$NoteListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteListItemModelImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int linesCount;
  final List<dynamic> _content;
  @override
  List<dynamic> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'NoteListItemModel(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, linesCount: $linesCount, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.linesCount, linesCount) ||
                other.linesCount == linesCount) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, updatedAt,
      linesCount, const DeepCollectionEquality().hash(_content));

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
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int linesCount,
      required final List<dynamic> content}) = _$NoteListItemModelImpl;

  factory _NoteListItemModel.fromJson(Map<String, dynamic> json) =
      _$NoteListItemModelImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get linesCount;
  @override
  List<dynamic> get content;

  /// Create a copy of NoteListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteListItemModelImplCopyWith<_$NoteListItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
