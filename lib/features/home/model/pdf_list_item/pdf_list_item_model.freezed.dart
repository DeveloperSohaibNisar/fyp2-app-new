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
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;

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
      {@JsonKey(name: '_id') int id, String title, DateTime date, int pages});
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
    Object? title = null,
    Object? date = null,
    Object? pages = null,
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
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
      {@JsonKey(name: '_id') int id, String title, DateTime date, int pages});
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
    Object? title = null,
    Object? date = null,
    Object? pages = null,
  }) {
    return _then(_$PdfListItemModelImpl(
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
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfListItemModelImpl implements _PdfListItemModel {
  const _$PdfListItemModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.title,
      required this.date,
      required this.pages});

  factory _$PdfListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfListItemModelImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final int id;
  @override
  final String title;
  @override
  final DateTime date;
  @override
  final int pages;

  @override
  String toString() {
    return 'PdfListItemModel(id: $id, title: $title, date: $date, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, date, pages);

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
      {@JsonKey(name: '_id') required final int id,
      required final String title,
      required final DateTime date,
      required final int pages}) = _$PdfListItemModelImpl;

  factory _PdfListItemModel.fromJson(Map<String, dynamic> json) =
      _$PdfListItemModelImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  int get id;
  @override
  String get title;
  @override
  DateTime get date;
  @override
  int get pages;

  /// Create a copy of PdfListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfListItemModelImplCopyWith<_$PdfListItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
