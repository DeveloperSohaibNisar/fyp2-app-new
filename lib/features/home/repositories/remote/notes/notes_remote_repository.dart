import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/models/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/core/models/note_list_item/note_list_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notes_remote_repository.g.dart';

@riverpod
NotesRemoteRepository notesRemoteRepository(NotesRemoteRepositoryRef ref) {
  return NotesRemoteRepository();
}

class NotesRemoteRepository {
  // Future<Either<GeneralFailure, NoteListItemModel>> uploadNote({
  //   required String noteName,
  //   required String token,
  // }) async {
  //   try {
  //     final response = await http
  //         .post(
  //       Uri.parse(
  //         '$serverURL/note/',
  //       ),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: jsonEncode({'name': noteName}),
  //     )
  //         .onError((e, st) {
  //       throw "Nerwork Error";
  //     });
  //     //     .timeout(
  //     //   const Duration(seconds: 30),
  //     //   onTimeout: () {
  //     //     throw 'Network Timeout Error';
  //     //   },
  //     // );

  //     final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

  //     if (response.statusCode == 200) {
  //       return Right(NoteListItemModel.fromJson(resBodyMap));
  //     } else if (resBodyMap.containsKey('message') && resBodyMap['message'] != null) {
  //       throw resBodyMap['message']!;
  //     } else {
  //       throw 'Something went wrong';
  //     }
  //   } catch (e) {
  //     return Left(GeneralFailure(message: e.toString()));
  //   }
  // }

  Future<Either<GeneralFailure, List<NoteListItemModel>>> getPaginatedNotes({
    required String token,
    required int page,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$serverURL/note/$page'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      )
          .onError((e, st) {
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
        List<NoteListItemModel> notes = [];
        for (final note in resBodyMap as List) {
          notes.add(NoteListItemModel.fromJson(note));
        }
        return Right(notes);
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
