// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PdfListItemModel _$PdfListItemModelFromJson(Map<String, dynamic> json) {
  return _PdfListItemModel.fromJson(json);
}

/// @nodoc
mixin _$PdfListItemModel {
// ignore: invalid_annotation_target
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get numpages => throw _privateConstructorUsedError;
  String get pdfUrl => throw _privateConstructorUsedError;
  SummaryData get summaryData => throw _privateConstructorUsedError;

  /// Serializes this PdfListItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PdfListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfListItemModelCopyWith<PdfListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfListItemModelCopyWith<$Res> {
  factory $PdfListItemModelCopyWith(
          PdfListItemModel value, $Res Function(PdfListItemModel) then) =
      _$PdfListItemModelCopyWithImpl<$Res, PdfListItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      DateTime createdAt,
      int numpages,
      String pdfUrl,
      SummaryData summaryData});

  $SummaryDataCopyWith<$Res> get summaryData;
}

/// @nodoc
class _$PdfListItemModelCopyWithImpl<$Res, $Val extends PdfListItemModel>
    implements $PdfListItemModelCopyWith<$Res> {
  _$PdfListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? numpages = null,
    Object? pdfUrl = null,
    Object? summaryData = null,
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
      numpages: null == numpages
          ? _value.numpages
          : numpages // ignore: cast_nullable_to_non_nullable
              as int,
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
      summaryData: null == summaryData
          ? _value.summaryData
          : summaryData // ignore: cast_nullable_to_non_nullable
              as SummaryData,
    ) as $Val);
  }

  /// Create a copy of PdfListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryDataCopyWith<$Res> get summaryData {
    return $SummaryDataCopyWith<$Res>(_value.summaryData, (value) {
      return _then(_value.copyWith(summaryData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PdfListItemModelImplCopyWith<$Res>
    implements $PdfListItemModelCopyWith<$Res> {
  factory _$$PdfListItemModelImplCopyWith(_$PdfListItemModelImpl value,
          $Res Function(_$PdfListItemModelImpl) then) =
      __$$PdfListItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      DateTime createdAt,
      int numpages,
      String pdfUrl,
      SummaryData summaryData});

  @override
  $SummaryDataCopyWith<$Res> get summaryData;
}

/// @nodoc
class __$$PdfListItemModelImplCopyWithImpl<$Res>
    extends _$PdfListItemModelCopyWithImpl<$Res, _$PdfListItemModelImpl>
    implements _$$PdfListItemModelImplCopyWith<$Res> {
  __$$PdfListItemModelImplCopyWithImpl(_$PdfListItemModelImpl _value,
      $Res Function(_$PdfListItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? numpages = null,
    Object? pdfUrl = null,
    Object? summaryData = null,
  }) {
    return _then(_$PdfListItemModelImpl(
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
      numpages: null == numpages
          ? _value.numpages
          : numpages // ignore: cast_nullable_to_non_nullable
              as int,
      pdfUrl: null == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String,
      summaryData: null == summaryData
          ? _value.summaryData
          : summaryData // ignore: cast_nullable_to_non_nullable
              as SummaryData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfListItemModelImpl implements _PdfListItemModel {
  const _$PdfListItemModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.createdAt,
      required this.numpages,
      required this.pdfUrl,
      required this.summaryData});

  factory _$PdfListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfListItemModelImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final int numpages;
  @override
  final String pdfUrl;
  @override
  final SummaryData summaryData;

  @override
  String toString() {
    return 'PdfListItemModel(id: $id, name: $name, createdAt: $createdAt, numpages: $numpages, pdfUrl: $pdfUrl, summaryData: $summaryData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.numpages, numpages) ||
                other.numpages == numpages) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.summaryData, summaryData) ||
                other.summaryData == summaryData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, createdAt, numpages, pdfUrl, summaryData);

  /// Create a copy of PdfListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfListItemModelImplCopyWith<_$PdfListItemModelImpl> get copyWith =>
      __$$PdfListItemModelImplCopyWithImpl<_$PdfListItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfListItemModelImplToJson(
      this,
    );
  }
}

abstract class _PdfListItemModel implements PdfListItemModel {
  const factory _PdfListItemModel(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final DateTime createdAt,
      required final int numpages,
      required final String pdfUrl,
      required final SummaryData summaryData}) = _$PdfListItemModelImpl;

  factory _PdfListItemModel.fromJson(Map<String, dynamic> json) =
      _$PdfListItemModelImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  int get numpages;
  @override
  String get pdfUrl;
  @override
  SummaryData get summaryData;

  /// Create a copy of PdfListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfListItemModelImplCopyWith<_$PdfListItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
