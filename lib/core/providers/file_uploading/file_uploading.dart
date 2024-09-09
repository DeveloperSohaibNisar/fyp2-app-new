import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_uploading.g.dart';

@Riverpod(keepAlive: true)
class FileUploading extends _$FileUploading {
  @override
  bool build() {
    return false;
  }

  void setFileUpload() {
    state = true;
  }

  void unsetFileUpload() {
    state = false;
  }
}
