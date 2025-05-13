import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/errors/failures.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/auth/data/repository/data_source/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/errors/exceptions.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<Either<Failures, UserCredential>> register(
    String email,
    String password,
  ) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        var credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        return Right(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseAuthCodes.weekPass) {
          return Left(
            ServerError(errorMessage: AppStrings.passwordIsTooWeek.tr()),
          );
        } else if (e.code == FirebaseAuthCodes.emailAlreadyInUse) {
          return Left(ServerError(errorMessage: AppStrings.accountExists.tr()));
        } else {
          return Left(ServerError(errorMessage: AppStrings.error));
        }
      } catch (e) {
        return Left(ServerError(errorMessage: e.toString()));
      }
    } else {
      return Left(
        NetworkError(errorMessage: AppStrings.noInternetConnection.tr()),
      );
    }
  }

  @override
  Future<Either<Failures, UserCredential>> login(
    String email,
    String password,
  ) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return Right(credential);
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseAuthCodes.userNotFound) {
          return Left(ServerError(errorMessage: AppStrings.noUserFound.tr()));
        } else if (e.code == FirebaseAuthCodes.wrongPass) {
          return Left(
            ServerError(errorMessage: AppStrings.wrongPasswordForThisUser.tr()),
          );
        } else {
          return Left(ServerError(errorMessage: AppStrings.error));
        }
      } catch (e) {
        return Left(ServerError(errorMessage: e.toString()));
      }
    } else {
      return Left(
        NetworkError(errorMessage: AppStrings.noInternetConnection.tr()),
      );
    }
  }
}
