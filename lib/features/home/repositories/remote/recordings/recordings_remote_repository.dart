import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/models/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/features/home/model/recording_list_item/recording_list_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recordings_remote_repository.g.dart';

@riverpod
RecordingsRemoteRepository recordingsRemoteRepository(RecordingsRemoteRepositoryRef ref) {
  return RecordingsRemoteRepository();
}

class RecordingsRemoteRepository {
  Future<Either<GeneralFailure, RecordingListItemModel>> uploadRecording({
    required File selectedAudio,
    required String audioName,
    required String token,
  }) async {
    try {
      final mediaType = lookupMimeType(selectedAudio.path)!.split('/');

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$serverURL/audio'),
      );

      request
        ..files.addAll(
          [
            await http.MultipartFile.fromPath('file', selectedAudio.path, contentType: MediaType(mediaType[0], mediaType[1])),
          ],
        )
        ..fields.addAll(
          {
            'name': audioName,
          },
        )
        ..headers.addAll(
          {
            'Authorization': 'Bearer $token',
          },
        );

      final response = await request.send().onError((e, st) {
        throw "Nerwork Error";
      });

      // .timeout(
      //   const Duration(seconds: 100),
      //   onTimeout: () {
      //     throw 'Network Timeout Error';
      //   },
      // );

      var uploadedAudio = await response.stream.bytesToString();
      final resBodyMap = jsonDecode(uploadedAudio) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return Right(RecordingListItemModel.fromJson(resBodyMap));
      } else if (resBodyMap.containsKey('message') && resBodyMap['message'] != null) {
        throw resBodyMap['message']!;
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  Future<Either<GeneralFailure, List<RecordingListItemModel>>> getPaginatedRecordings({
    required String token,
    required int page,
  }) async {
    try {
      final response = await http.get(Uri.parse('$serverURL/audio/$page'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      })   .onError((e, st) {
        throw "Nerwork Error";
      });
      // .timeout(
      //   const Duration(seconds: 30),
      //   onTimeout: () {
      //     throw 'Network Timeout Error';
      //   },
      // );

      var resBodyMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<RecordingListItemModel> recordings = [];
        for (final recording in resBodyMap as List) {
          recordings.add(RecordingListItemModel.fromJson(recording));
        }
        return Right(recordings);
      } else if (resBodyMap.containsKey('message') && resBodyMap['message'] != null) {
        throw resBodyMap['message']!;
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
