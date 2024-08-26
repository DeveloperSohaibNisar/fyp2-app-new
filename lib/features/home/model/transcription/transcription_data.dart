import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyp2_clean_architecture/features/home/model/transcription/transcription_chunk.dart';

part 'transcription_data.freezed.dart';
part 'transcription_data.g.dart';

@freezed
class TranscriptionData with _$TranscriptionData {
  const factory TranscriptionData({
    required String text,
    required List<TranscriptionChunk> chunks,
  }) = _TranscriptionData;

  factory TranscriptionData.fromJson(Map<String, Object?> json) =>
      _$TranscriptionDataFromJson(json);
}
