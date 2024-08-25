import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/features/home/model/pdf_list_item/pdf_list_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdfs_remote_repository.g.dart';

@riverpod
PdfsRemoteRepository pdfsRemoteRepository(PdfsRemoteRepositoryRef ref) {
  return PdfsRemoteRepository();
}

class PdfsRemoteRepository {
  Future<Either<GeneralFailure, List<PdfListItemModel>>> getPaginatedPdfs({
    required String token,
    required int page,
  }) async {
    try {
      final response =
          await http.get(Uri.parse('$serverURL/pdf/$page'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var resBodyMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<PdfListItemModel> pdfs = [];
        resBodyMap = resBodyMap as List;
        for (final recording in resBodyMap) {
          pdfs.add(PdfListItemModel.fromJson(recording));
        }
        return Right(pdfs);
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
