// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcription_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TranscriptionData _$TranscriptionDataFromJson(Map<String, dynamic> json) {
  return _TranscriptionData.fromJson(json);
}

/// @nodoc
mixin _$TranscriptionData {
  String get text => throw _privateConstructorUsedError;
  List<TranscriptionChunk> get chunks => throw _privateConstructorUsedError;

  /// Serializes this TranscriptionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscriptionDataCopyWith<TranscriptionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscriptionDataCopyWith<$Res> {
  factory $TranscriptionDataCopyWith(
          TranscriptionData value, $Res Function(TranscriptionData) then) =
      _$TranscriptionDataCopyWithImpl<$Res, TranscriptionData>;
  @useResult
  $Res call({String text, List<TranscriptionChunk> chunks});
}

/// @nodoc
class _$TranscriptionDataCopyWithImpl<$Res, $Val extends TranscriptionData>
    implements $TranscriptionDataCopyWith<$Res> {
  _$TranscriptionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? chunks = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      chunks: null == chunks
          ? _value.chunks
          : chunks // ignore: cast_nullable_to_non_nullable
              as List<TranscriptionChunk>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranscriptionDataImplCopyWith<$Res>
    implements $TranscriptionDataCopyWith<$Res> {
  factory _$$TranscriptionDataImplCopyWith(_$TranscriptionDataImpl value,
          $Res Function(_$TranscriptionDataImpl) then) =
      __$$TranscriptionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, List<TranscriptionChunk> chunks});
}

/// @nodoc
class __$$TranscriptionDataImplCopyWithImpl<$Res>
    extends _$TranscriptionDataCopyWithImpl<$Res, _$TranscriptionDataImpl>
    implements _$$TranscriptionDataImplCopyWith<$Res> {
  __$$TranscriptionDataImplCopyWithImpl(_$TranscriptionDataImpl _value,
      $Res Function(_$TranscriptionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TranscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? chunks = null,
  }) {
    return _then(_$TranscriptionDataImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      chunks: null == chunks
          ? _value._chunks
          : chunks // ignore: cast_nullable_to_non_nullable
              as List<TranscriptionChunk>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranscriptionDataImpl implements _TranscriptionData {
  const _$TranscriptionDataImpl(
      {required this.text, required final List<TranscriptionChunk> chunks})
      : _chunks = chunks;

  factory _$TranscriptionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranscriptionDataImplFromJson(json);

  @override
  final String text;
  final List<TranscriptionChunk> _chunks;
  @override
  List<TranscriptionChunk> get chunks {
    if (_chunks is EqualUnmodifiableListView) return _chunks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chunks);
  }

  @override
  String toString() {
    return 'TranscriptionData(text: $text, chunks: $chunks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscriptionDataImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._chunks, _chunks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(_chunks));

  /// Create a copy of TranscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscriptionDataImplCopyWith<_$TranscriptionDataImpl> get copyWith =>
      __$$TranscriptionDataImplCopyWithImpl<_$TranscriptionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranscriptionDataImplToJson(
      this,
    );
  }
}

abstract class _TranscriptionData implements TranscriptionData {
  const factory _TranscriptionData(
          {required final String text,
          required final List<TranscriptionChunk> chunks}) =
      _$TranscriptionDataImpl;

  factory _TranscriptionData.fromJson(Map<String, dynamic> json) =
      _$TranscriptionDataImpl.fromJson;

  @override
  String get text;
  @override
  List<TranscriptionChunk> get chunks;

  /// Create a copy of TranscriptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscriptionDataImplCopyWith<_$TranscriptionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
