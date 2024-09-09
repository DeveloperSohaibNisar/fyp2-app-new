import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/models/failures/general_failure.dart';
import 'package:fyp2_clean_architecture/features/home/model/pdf_list_item/pdf_list_item_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdfs_remote_repository.g.dart';

@riverpod
PdfsRemoteRepository pdfsRemoteRepository(PdfsRemoteRepositoryRef ref) {
  return PdfsRemoteRepository();
}

class PdfsRemoteRepository {
  Future<Either<GeneralFailure, PdfListItemModel>> uploadPdf({
    required File selectedPdf,
    required String pdfName,
    required String token,
  }) async {
    try {
      final mediaType = lookupMimeType(selectedPdf.path)!.split('/');

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$serverURL/pdf'),
      );

      request
        ..files.addAll(
          [
            await http.MultipartFile.fromPath('file', selectedPdf.path,
                contentType: MediaType(mediaType[0], mediaType[1])),
          ],
        )
        ..fields.addAll(
          {
            'name': pdfName,
          },
        )
        ..headers.addAll(
          {
            'Authorization': 'Bearer $token',
          },
        );

      final response = await request.send();
      // .timeout(
      //   const Duration(seconds: 100),
      //   onTimeout: () {
      //     throw 'Network Timeout Error';
      //   },
      // );

      var uploadedAudio = await response.stream.bytesToString();
      final resBodyMap = jsonDecode(uploadedAudio) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        return Right(PdfListItemModel.fromJson(resBodyMap));
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

  Future<Either<GeneralFailure, List<PdfListItemModel>>> getPaginatedPdfs({
    required String token,
    required int page,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$serverURL/pdf/$page'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      // .timeout(
      //   const Duration(seconds: 30),
      //   onTimeout: () {
      //     throw 'Network Timeout Error';
      //   },
      // );

      var resBodyMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<PdfListItemModel> pdfs = [];
        for (final pdf in resBodyMap as List) {
          pdfs.add(PdfListItemModel.fromJson(pdf));
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
