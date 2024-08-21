import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/core/models/user/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_remote_repository.g.dart';

@Riverpod(keepAlive: true)
UserRemoteRepository userRemoteRepository(UserRemoteRepositoryRef ref) {
  return UserRemoteRepository();
}

class UserRemoteRepository {
  Future<Either<GeneralFailure, UserModel>> getUserData(
      {required String token}) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$serverURL/user/',
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

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(resBodyMap).copyWith(token: token));
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
