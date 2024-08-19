// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecordingListItemModel _$RecordingListItemModelFromJson(
    Map<String, dynamic> json) {
  return _RecordingListItemModel.fromJson(json);
}

/// @nodoc
mixin _$RecordingListItemModel {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Duration get length => throw _privateConstructorUsedError;

  /// Serializes this RecordingListItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordingListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordingListItemModelCopyWith<RecordingListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingListItemModelCopyWith<$Res> {
  factory $RecordingListItemModelCopyWith(RecordingListItemModel value,
          $Res Function(RecordingListItemModel) then) =
      _$RecordingListItemModelCopyWithImpl<$Res, RecordingListItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') int id,
      String title,
      DateTime date,
      Duration length});
}

/// @nodoc
class _$RecordingListItemModelCopyWithImpl<$Res,
        $Val extends RecordingListItemModel>
    implements $RecordingListItemModelCopyWith<$Res> {
  _$RecordingListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordingListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? date = null,
    Object? length = null,
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordingListItemModelImplCopyWith<$Res>
    implements $RecordingListItemModelCopyWith<$Res> {
  factory _$$RecordingListItemModelImplCopyWith(
          _$RecordingListItemModelImpl value,
          $Res Function(_$RecordingListItemModelImpl) then) =
      __$$RecordingListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') int id,
      String title,
      DateTime date,
      Duration length});
}

/// @nodoc
class __$$RecordingListItemModelImplCopyWithImpl<$Res>
    extends _$RecordingListItemModelCopyWithImpl<$Res,
        _$RecordingListItemModelImpl>
    implements _$$RecordingListItemModelImplCopyWith<$Res> {
  __$$RecordingListItemModelImplCopyWithImpl(
      _$RecordingListItemModelImpl _value,
      $Res Function(_$RecordingListItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordingListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? date = null,
    Object? length = null,
  }) {
    return _then(_$RecordingListItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordingListItemModelImpl implements _RecordingListItemModel {
  const _$RecordingListItemModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.date,
      required this.length});

  factory _$RecordingListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordingListItemModelImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final int id;
  @override
  final String title;
  @override
  final DateTime date;
  @override
  final Duration length;

  @override
  String toString() {
    return 'RecordingListItemModel(id: $id, title: $title, date: $date, length: $length)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.length, length) || other.length == length));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, date, length);

  /// Create a copy of RecordingListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingListItemModelImplCopyWith<_$RecordingListItemModelImpl>
      get copyWith => __$$RecordingListItemModelImplCopyWithImpl<
          _$RecordingListItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordingListItemModelImplToJson(
      this,
    );
  }
}

abstract class _RecordingListItemModel implements RecordingListItemModel {
  const factory _RecordingListItemModel(
      {@JsonKey(name: '_id') required final int id,
      required final String title,
      required final DateTime date,
      required final Duration length}) = _$RecordingListItemModelImpl;

  factory _RecordingListItemModel.fromJson(Map<String, dynamic> json) =
      _$RecordingListItemModelImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  int get id;
  @override
  String get title;
  @override
  DateTime get date;
  @override
  Duration get length;

  /// Create a copy of RecordingListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingListItemModelImplCopyWith<_$RecordingListItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
