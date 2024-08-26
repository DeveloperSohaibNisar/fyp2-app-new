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
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get uploadDate => throw _privateConstructorUsedError;
  Duration get audioLength => throw _privateConstructorUsedError;
  String get audioUrl => throw _privateConstructorUsedError;
  bool get isTranscriptionCreated => throw _privateConstructorUsedError;
  bool get isVectorDatabaseCreated => throw _privateConstructorUsedError;
  bool get isSummaryCreated => throw _privateConstructorUsedError;
  TranscriptionData get transcriptionData => throw _privateConstructorUsedError;
  String get summaryText => throw _privateConstructorUsedError;

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
      {@JsonKey(name: '_id') String id,
      String name,
      DateTime uploadDate,
      Duration audioLength,
      String audioUrl,
      bool isTranscriptionCreated,
      bool isVectorDatabaseCreated,
      bool isSummaryCreated,
      TranscriptionData transcriptionData,
      String summaryText});

  $TranscriptionDataCopyWith<$Res> get transcriptionData;
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
    Object? name = null,
    Object? uploadDate = null,
    Object? audioLength = null,
    Object? audioUrl = null,
    Object? isTranscriptionCreated = null,
    Object? isVectorDatabaseCreated = null,
    Object? isSummaryCreated = null,
    Object? transcriptionData = null,
    Object? summaryText = null,
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
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      audioLength: null == audioLength
          ? _value.audioLength
          : audioLength // ignore: cast_nullable_to_non_nullable
              as Duration,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isTranscriptionCreated: null == isTranscriptionCreated
          ? _value.isTranscriptionCreated
          : isTranscriptionCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isVectorDatabaseCreated: null == isVectorDatabaseCreated
          ? _value.isVectorDatabaseCreated
          : isVectorDatabaseCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isSummaryCreated: null == isSummaryCreated
          ? _value.isSummaryCreated
          : isSummaryCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      transcriptionData: null == transcriptionData
          ? _value.transcriptionData
          : transcriptionData // ignore: cast_nullable_to_non_nullable
              as TranscriptionData,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of RecordingListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranscriptionDataCopyWith<$Res> get transcriptionData {
    return $TranscriptionDataCopyWith<$Res>(_value.transcriptionData, (value) {
      return _then(_value.copyWith(transcriptionData: value) as $Val);
    });
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
      {@JsonKey(name: '_id') String id,
      String name,
      DateTime uploadDate,
      Duration audioLength,
      String audioUrl,
      bool isTranscriptionCreated,
      bool isVectorDatabaseCreated,
      bool isSummaryCreated,
      TranscriptionData transcriptionData,
      String summaryText});

  @override
  $TranscriptionDataCopyWith<$Res> get transcriptionData;
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
    Object? name = null,
    Object? uploadDate = null,
    Object? audioLength = null,
    Object? audioUrl = null,
    Object? isTranscriptionCreated = null,
    Object? isVectorDatabaseCreated = null,
    Object? isSummaryCreated = null,
    Object? transcriptionData = null,
    Object? summaryText = null,
  }) {
    return _then(_$RecordingListItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      audioLength: null == audioLength
          ? _value.audioLength
          : audioLength // ignore: cast_nullable_to_non_nullable
              as Duration,
      audioUrl: null == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isTranscriptionCreated: null == isTranscriptionCreated
          ? _value.isTranscriptionCreated
          : isTranscriptionCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isVectorDatabaseCreated: null == isVectorDatabaseCreated
          ? _value.isVectorDatabaseCreated
          : isVectorDatabaseCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      isSummaryCreated: null == isSummaryCreated
          ? _value.isSummaryCreated
          : isSummaryCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      transcriptionData: null == transcriptionData
          ? _value.transcriptionData
          : transcriptionData // ignore: cast_nullable_to_non_nullable
              as TranscriptionData,
      summaryText: null == summaryText
          ? _value.summaryText
          : summaryText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordingListItemModelImpl implements _RecordingListItemModel {
  const _$RecordingListItemModelImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.uploadDate,
      required this.audioLength,
      required this.audioUrl,
      required this.isTranscriptionCreated,
      required this.isVectorDatabaseCreated,
      required this.isSummaryCreated,
      required this.transcriptionData,
      required this.summaryText});

  factory _$RecordingListItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordingListItemModelImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final DateTime uploadDate;
  @override
  final Duration audioLength;
  @override
  final String audioUrl;
  @override
  final bool isTranscriptionCreated;
  @override
  final bool isVectorDatabaseCreated;
  @override
  final bool isSummaryCreated;
  @override
  final TranscriptionData transcriptionData;
  @override
  final String summaryText;

  @override
  String toString() {
    return 'RecordingListItemModel(id: $id, name: $name, uploadDate: $uploadDate, audioLength: $audioLength, audioUrl: $audioUrl, isTranscriptionCreated: $isTranscriptionCreated, isVectorDatabaseCreated: $isVectorDatabaseCreated, isSummaryCreated: $isSummaryCreated, transcriptionData: $transcriptionData, summaryText: $summaryText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingListItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.audioLength, audioLength) ||
                other.audioLength == audioLength) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.isTranscriptionCreated, isTranscriptionCreated) ||
                other.isTranscriptionCreated == isTranscriptionCreated) &&
            (identical(
                    other.isVectorDatabaseCreated, isVectorDatabaseCreated) ||
                other.isVectorDatabaseCreated == isVectorDatabaseCreated) &&
            (identical(other.isSummaryCreated, isSummaryCreated) ||
                other.isSummaryCreated == isSummaryCreated) &&
            (identical(other.transcriptionData, transcriptionData) ||
                other.transcriptionData == transcriptionData) &&
            (identical(other.summaryText, summaryText) ||
                other.summaryText == summaryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      uploadDate,
      audioLength,
      audioUrl,
      isTranscriptionCreated,
      isVectorDatabaseCreated,
      isSummaryCreated,
      transcriptionData,
      summaryText);

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
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final DateTime uploadDate,
      required final Duration audioLength,
      required final String audioUrl,
      required final bool isTranscriptionCreated,
      required final bool isVectorDatabaseCreated,
      required final bool isSummaryCreated,
      required final TranscriptionData transcriptionData,
      required final String summaryText}) = _$RecordingListItemModelImpl;

  factory _RecordingListItemModel.fromJson(Map<String, dynamic> json) =
      _$RecordingListItemModelImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  DateTime get uploadDate;
  @override
  Duration get audioLength;
  @override
  String get audioUrl;
  @override
  bool get isTranscriptionCreated;
  @override
  bool get isVectorDatabaseCreated;
  @override
  bool get isSummaryCreated;
  @override
  TranscriptionData get transcriptionData;
  @override
  String get summaryText;

  /// Create a copy of RecordingListItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingListItemModelImplCopyWith<_$RecordingListItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
