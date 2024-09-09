import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/models/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/core/models/chat/chat_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_remote_repository.g.dart';

@riverpod
ChatRemoteRepository chatRemoteRepository(ChatRemoteRepositoryRef ref) {
  return ChatRemoteRepository();
}

class ChatRemoteRepository {
  Future<Either<GeneralFailure, List<ChatModel>>> getChats(
      {required String token, required String sourceId}) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$serverURL/chat/$sourceId',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw 'Network Timeout Error';
        },
      );

      var resBodyMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<ChatModel> chats = [];
        for (final pdf in resBodyMap as List) {
          chats.add(ChatModel.fromJson(pdf));
        }
        return Right(chats);
      } else if (resBodyMap.containsKey('message') &&
          resBodyMap['message'] != null) {
        throw resBodyMap['message']!;
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  Future<Either<GeneralFailure, ChatModel>> chat({
    required String sourceId,
    required String token,
    required String query,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          '$serverURL/chat/$sourceId',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'query': query}),
      );
      //   .timeout(
      //   const Duration(seconds: 30),
      //   onTimeout: () {
      //     throw 'Network Timeout Error';
      //   },
      // );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        return Right(ChatModel.fromJson(resBodyMap));
      } else if (resBodyMap.containsKey('message') &&
          resBodyMap['message'] != null) {
        throw resBodyMap['message']!;
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
