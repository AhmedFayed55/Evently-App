import 'package:dartz/dartz.dart';
import 'package:evently_app/core/errors/failures.dart';
import 'package:evently_app/features/auth/data/repository/data_source/auth_data_source.dart';
import 'package:evently_app/features/auth/data/repository/repos/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.dataSource});

  AuthDataSource dataSource;

  @override
  Future<Either<Failures, UserCredential>> register(
    String email,
    String password,
  ) async {
    var either = await dataSource.register(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, UserCredential>> login(
    String email,
    String password,
  ) async {
    var either = await dataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
