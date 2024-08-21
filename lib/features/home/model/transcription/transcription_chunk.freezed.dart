// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcription_chunk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TranscriptionChunk _$TranscriptionChunkFromJson(Map<String, dynamic> json) {
  return _TranscriptionChunk.fromJson(json);
}

/// @nodoc
mixin _$TranscriptionChunk {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @DurationConverter()
  List<Duration> get timestamp => throw _privateConstructorUsedError;

  /// Serializes this TranscriptionChunk to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranscriptionChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscriptionChunkCopyWith<TranscriptionChunk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscriptionChunkCopyWith<$Res> {
  factory $TranscriptionChunkCopyWith(
          TranscriptionChunk value, $Res Function(TranscriptionChunk) then) =
      _$TranscriptionChunkCopyWithImpl<$Res, TranscriptionChunk>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String text,
      @DurationConverter() List<Duration> timestamp});
}

/// @nodoc
class _$TranscriptionChunkCopyWithImpl<$Res, $Val extends TranscriptionChunk>
    implements $TranscriptionChunkCopyWith<$Res> {
  _$TranscriptionChunkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscriptionChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as List<Duration>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranscriptionChunkImplCopyWith<$Res>
    implements $TranscriptionChunkCopyWith<$Res> {
  factory _$$TranscriptionChunkImplCopyWith(_$TranscriptionChunkImpl value,
          $Res Function(_$TranscriptionChunkImpl) then) =
      __$$TranscriptionChunkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String text,
      @DurationConverter() List<Duration> timestamp});
}

/// @nodoc
class __$$TranscriptionChunkImplCopyWithImpl<$Res>
    extends _$TranscriptionChunkCopyWithImpl<$Res, _$TranscriptionChunkImpl>
    implements _$$TranscriptionChunkImplCopyWith<$Res> {
  __$$TranscriptionChunkImplCopyWithImpl(_$TranscriptionChunkImpl _value,
      $Res Function(_$TranscriptionChunkImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscriptionChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? timestamp = null,
  }) {
    return _then(_$TranscriptionChunkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value._timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as List<Duration>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranscriptionChunkImpl implements _TranscriptionChunk {
  const _$TranscriptionChunkImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.text,
      @DurationConverter() required final List<Duration> timestamp})
      : _timestamp = timestamp;

  factory _$TranscriptionChunkImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranscriptionChunkImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String text;
  final List<Duration> _timestamp;
  @override
  @DurationConverter()
  List<Duration> get timestamp {
    if (_timestamp is EqualUnmodifiableListView) return _timestamp;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timestamp);
  }

  @override
  String toString() {
    return 'TranscriptionChunk(id: $id, text: $text, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscriptionChunkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._timestamp, _timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, text, const DeepCollectionEquality().hash(_timestamp));

  /// Create a copy of TranscriptionChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscriptionChunkImplCopyWith<_$TranscriptionChunkImpl> get copyWith =>
      __$$TranscriptionChunkImplCopyWithImpl<_$TranscriptionChunkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranscriptionChunkImplToJson(
      this,
    );
  }
}

abstract class _TranscriptionChunk implements TranscriptionChunk {
  const factory _TranscriptionChunk(
          {@JsonKey(name: '_id') required final String id,
          required final String text,
          @DurationConverter() required final List<Duration> timestamp}) =
      _$TranscriptionChunkImpl;

  factory _TranscriptionChunk.fromJson(Map<String, dynamic> json) =
      _$TranscriptionChunkImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get text;
  @override
  @DurationConverter()
  List<Duration> get timestamp;

  /// Create a copy of TranscriptionChunk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscriptionChunkImplCopyWith<_$TranscriptionChunkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
