import 'package:dartz/dartz.dart';
import 'package:fyp2_clean_architecture/core/models/failures/general_failure.dart';

class FormFieldFailure implements Exception {
  final Map<String, dynamic> errors;

  FormFieldFailure({required this.errors});
}

class FormFailure implements Exception {
  final Either<FormFieldFailure, GeneralFailure> failure;

  FormFailure({required this.failure});
}
