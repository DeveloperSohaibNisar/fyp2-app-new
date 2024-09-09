// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SummaryData _$SummaryDataFromJson(Map<String, dynamic> json) {
  return _SummaryData.fromJson(json);
}

/// @nodoc
mixin _$SummaryData {
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  AdditionalInfo get additionalInfo => throw _privateConstructorUsedError;

  /// Serializes this SummaryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryDataCopyWith<SummaryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryDataCopyWith<$Res> {
  factory $SummaryDataCopyWith(
          SummaryData value, $Res Function(SummaryData) then) =
      _$SummaryDataCopyWithImpl<$Res, SummaryData>;
  @useResult
  $Res call({String title, String summary, AdditionalInfo additionalInfo});

  $AdditionalInfoCopyWith<$Res> get additionalInfo;
}

/// @nodoc
class _$SummaryDataCopyWithImpl<$Res, $Val extends SummaryData>
    implements $SummaryDataCopyWith<$Res> {
  _$SummaryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? summary = null,
    Object? additionalInfo = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as AdditionalInfo,
    ) as $Val);
  }

  /// Create a copy of SummaryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdditionalInfoCopyWith<$Res> get additionalInfo {
    return $AdditionalInfoCopyWith<$Res>(_value.additionalInfo, (value) {
      return _then(_value.copyWith(additionalInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SummaryDataImplCopyWith<$Res>
    implements $SummaryDataCopyWith<$Res> {
  factory _$$SummaryDataImplCopyWith(
          _$SummaryDataImpl value, $Res Function(_$SummaryDataImpl) then) =
      __$$SummaryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String summary, AdditionalInfo additionalInfo});

  @override
  $AdditionalInfoCopyWith<$Res> get additionalInfo;
}

/// @nodoc
class __$$SummaryDataImplCopyWithImpl<$Res>
    extends _$SummaryDataCopyWithImpl<$Res, _$SummaryDataImpl>
    implements _$$SummaryDataImplCopyWith<$Res> {
  __$$SummaryDataImplCopyWithImpl(
      _$SummaryDataImpl _value, $Res Function(_$SummaryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of SummaryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? summary = null,
    Object? additionalInfo = null,
  }) {
    return _then(_$SummaryDataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as AdditionalInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryDataImpl implements _SummaryData {
  const _$SummaryDataImpl(
      {required this.title,
      required this.summary,
      required this.additionalInfo});

  factory _$SummaryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryDataImplFromJson(json);

  @override
  final String title;
  @override
  final String summary;
  @override
  final AdditionalInfo additionalInfo;

  @override
  String toString() {
    return 'SummaryData(title: $title, summary: $summary, additionalInfo: $additionalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, summary, additionalInfo);

  /// Create a copy of SummaryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryDataImplCopyWith<_$SummaryDataImpl> get copyWith =>
      __$$SummaryDataImplCopyWithImpl<_$SummaryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryDataImplToJson(
      this,
    );
  }
}

abstract class _SummaryData implements SummaryData {
  const factory _SummaryData(
      {required final String title,
      required final String summary,
      required final AdditionalInfo additionalInfo}) = _$SummaryDataImpl;

  factory _SummaryData.fromJson(Map<String, dynamic> json) =
      _$SummaryDataImpl.fromJson;

  @override
  String get title;
  @override
  String get summary;
  @override
  AdditionalInfo get additionalInfo;

  /// Create a copy of SummaryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryDataImplCopyWith<_$SummaryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
