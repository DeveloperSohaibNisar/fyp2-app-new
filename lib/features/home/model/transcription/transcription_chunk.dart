import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcription_chunk.freezed.dart';
part 'transcription_chunk.g.dart';

@freezed
class TranscriptionChunk with _$TranscriptionChunk {
  const factory TranscriptionChunk({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String text,
    @DurationConverter() required List<Duration> timestamp,
  }) = _TranscriptionChunk;

  factory TranscriptionChunk.fromJson(Map<String, Object?> json) =>
      _$TranscriptionChunkFromJson(json);
}

class DurationConverter implements JsonConverter<Duration, dynamic> {
  const DurationConverter();

  @override
  Duration fromJson(dynamic json) {
    if (json == null) {
      return const Duration(microseconds: 0);
    }
    if (json is num) {
      return Duration(milliseconds: (json * 1000).toInt());
    } else {
      throw const FormatException('Expected a number');
    }
  }

  @override
  dynamic toJson(Duration duration) => duration.inMilliseconds / 1000;
}
