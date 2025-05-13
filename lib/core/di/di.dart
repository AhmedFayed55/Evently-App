import 'package:evently_app/features/auth/data/repository/data_source/auth_data_source.dart';
import 'package:evently_app/features/auth/data/repository/data_source/auth_data_source_impl.dart';
import 'package:evently_app/features/auth/data/repository/repos/auth_repository.dart';
import 'package:evently_app/features/auth/data/repository/repos/auth_repository_impl.dart';
import 'package:evently_app/features/auth/presentation/manager/auth_view_model.dart';

AuthViewModel injectAuthViewModel() {
  return AuthViewModel(repository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(dataSource: injectAuthDataSource());
}

AuthDataSource injectAuthDataSource() {
  return AuthDataSourceImpl();
}
