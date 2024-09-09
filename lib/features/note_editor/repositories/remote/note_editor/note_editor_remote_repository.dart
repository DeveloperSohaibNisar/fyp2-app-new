import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/models/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_editor_remote_repository.g.dart';

@riverpod
NoteEditorRemoteRepository noteEditorRemoteRepository(NoteEditorRemoteRepositoryRef ref) {
  return NoteEditorRemoteRepository();
}

class NoteEditorRemoteRepository {
  Future<Either<GeneralFailure, NoteListItemModel>> saveNote({
    required NoteListItemModel note,
    required String token,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(
          '$serverURL/note/',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'newNote': note}),
      );
      //     .timeout(
      //   const Duration(seconds: 30),
      //   onTimeout: () {
      //     throw 'Network Timeout Error';
      //   },
      // );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        return Right(NoteListItemModel.fromJson(resBodyMap));
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
