import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/errors/failures.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/add_event/data/data_sources/add_event_data_source.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';

import '../../../../core/firebase/firestore_handler.dart';

class AddEventDataSourceImpl implements AddEventDataSource {
  @override
  Future<Either<Failures, void>> createEvent(Event event) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        await FireStoreHandler.createEvent(event);
        return Right(null);
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
