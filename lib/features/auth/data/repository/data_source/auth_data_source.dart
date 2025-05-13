import 'package:dartz/dartz.dart';
import 'package:evently_app/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  Future<Either<Failures, UserCredential>> register(
    String email,
    String password,
  );

  Future<Either<Failures, UserCredential>> login(String email, String password);
}
