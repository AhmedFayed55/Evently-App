import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, UserCredential>> register(
    String email,
    String password,
  );

  Future<Either<Failures, UserCredential>> login(String email, String password);
}
