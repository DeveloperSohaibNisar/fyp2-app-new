import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/failures/form_faliure.dart';
import 'package:fyp2_clean_architecture/core/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/features/auth/model/token_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository();
}

class AuthRemoteRepository {
  Future<Either<FormFailure, TokenModel>> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await http
          .post(
        Uri.parse(
          '$serverURL/signup/',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'name': name,
            'email': email,
            'password': password,
            'confirmPassword': confirmPassword,
          },
        ),
      )
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw 'Network Timeout Error';
        },
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201) {
        return Right(TokenModel(token: resBodyMap['token']));
      } else if (response.statusCode == 400) {
        return Left(
            FormFailure(failure: Left(FormFieldFailure(errors: resBodyMap))));
      } else if (resBodyMap.containsKey('message') &&
          resBodyMap['message'] != null) {
        throw resBodyMap['message']!;
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      return Left(
          FormFailure(failure: Right(GeneralFailure(message: e.toString()))));
    }
  }

  Future<Either<FormFailure, TokenModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http
          .post(
        Uri.parse(
          '$serverURL/login/',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      )
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw 'Network Timeout Error';
        },
      );

      final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 202) {
        return Right(TokenModel(token: resBodyMap['token']));
      } else if (response.statusCode == 400) {
        return Left(
            FormFailure(failure: Left(FormFieldFailure(errors: resBodyMap))));
      } else if (resBodyMap.containsKey('message') &&
          resBodyMap['message'] != null) {
        throw resBodyMap['message']!;
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      return Left(
          FormFailure(failure: Right(GeneralFailure(message: e.toString()))));
    }
  }
}
