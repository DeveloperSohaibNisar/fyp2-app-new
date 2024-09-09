// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'additional_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) {
  return _AdditionalInfo.fromJson(json);
}

/// @nodoc
mixin _$AdditionalInfo {
  List<String> get mainPoints => throw _privateConstructorUsedError;
  List<String> get actionItems => throw _privateConstructorUsedError;
  List<String> get followUpQuestions => throw _privateConstructorUsedError;

  /// Serializes this AdditionalInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdditionalInfoCopyWith<AdditionalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionalInfoCopyWith<$Res> {
  factory $AdditionalInfoCopyWith(
          AdditionalInfo value, $Res Function(AdditionalInfo) then) =
      _$AdditionalInfoCopyWithImpl<$Res, AdditionalInfo>;
  @useResult
  $Res call(
      {List<String> mainPoints,
      List<String> actionItems,
      List<String> followUpQuestions});
}

/// @nodoc
class _$AdditionalInfoCopyWithImpl<$Res, $Val extends AdditionalInfo>
    implements $AdditionalInfoCopyWith<$Res> {
  _$AdditionalInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainPoints = null,
    Object? actionItems = null,
    Object? followUpQuestions = null,
  }) {
    return _then(_value.copyWith(
      mainPoints: null == mainPoints
          ? _value.mainPoints
          : mainPoints // ignore: cast_nullable_to_non_nullable
              as List<String>,
      actionItems: null == actionItems
          ? _value.actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followUpQuestions: null == followUpQuestions
          ? _value.followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdditionalInfoImplCopyWith<$Res>
    implements $AdditionalInfoCopyWith<$Res> {
  factory _$$AdditionalInfoImplCopyWith(_$AdditionalInfoImpl value,
          $Res Function(_$AdditionalInfoImpl) then) =
      __$$AdditionalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> mainPoints,
      List<String> actionItems,
      List<String> followUpQuestions});
}

/// @nodoc
class __$$AdditionalInfoImplCopyWithImpl<$Res>
    extends _$AdditionalInfoCopyWithImpl<$Res, _$AdditionalInfoImpl>
    implements _$$AdditionalInfoImplCopyWith<$Res> {
  __$$AdditionalInfoImplCopyWithImpl(
      _$AdditionalInfoImpl _value, $Res Function(_$AdditionalInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainPoints = null,
    Object? actionItems = null,
    Object? followUpQuestions = null,
  }) {
    return _then(_$AdditionalInfoImpl(
      mainPoints: null == mainPoints
          ? _value._mainPoints
          : mainPoints // ignore: cast_nullable_to_non_nullable
              as List<String>,
      actionItems: null == actionItems
          ? _value._actionItems
          : actionItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followUpQuestions: null == followUpQuestions
          ? _value._followUpQuestions
          : followUpQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdditionalInfoImpl implements _AdditionalInfo {
  const _$AdditionalInfoImpl(
      {required final List<String> mainPoints,
      required final List<String> actionItems,
      required final List<String> followUpQuestions})
      : _mainPoints = mainPoints,
        _actionItems = actionItems,
        _followUpQuestions = followUpQuestions;

  factory _$AdditionalInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionalInfoImplFromJson(json);

  final List<String> _mainPoints;
  @override
  List<String> get mainPoints {
    if (_mainPoints is EqualUnmodifiableListView) return _mainPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mainPoints);
  }

  final List<String> _actionItems;
  @override
  List<String> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  final List<String> _followUpQuestions;
  @override
  List<String> get followUpQuestions {
    if (_followUpQuestions is EqualUnmodifiableListView)
      return _followUpQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followUpQuestions);
  }

  @override
  String toString() {
    return 'AdditionalInfo(mainPoints: $mainPoints, actionItems: $actionItems, followUpQuestions: $followUpQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionalInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._mainPoints, _mainPoints) &&
            const DeepCollectionEquality()
                .equals(other._actionItems, _actionItems) &&
            const DeepCollectionEquality()
                .equals(other._followUpQuestions, _followUpQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mainPoints),
      const DeepCollectionEquality().hash(_actionItems),
      const DeepCollectionEquality().hash(_followUpQuestions));

  /// Create a copy of AdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionalInfoImplCopyWith<_$AdditionalInfoImpl> get copyWith =>
      __$$AdditionalInfoImplCopyWithImpl<_$AdditionalInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdditionalInfoImplToJson(
      this,
    );
  }
}

abstract class _AdditionalInfo implements AdditionalInfo {
  const factory _AdditionalInfo(
      {required final List<String> mainPoints,
      required final List<String> actionItems,
      required final List<String> followUpQuestions}) = _$AdditionalInfoImpl;

  factory _AdditionalInfo.fromJson(Map<String, dynamic> json) =
      _$AdditionalInfoImpl.fromJson;

  @override
  List<String> get mainPoints;
  @override
  List<String> get actionItems;
  @override
  List<String> get followUpQuestions;

  /// Create a copy of AdditionalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdditionalInfoImplCopyWith<_$AdditionalInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
