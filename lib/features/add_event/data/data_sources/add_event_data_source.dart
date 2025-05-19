import 'package:dartz/dartz.dart';
import 'package:evently_app/core/errors/failures.dart';

import '../models/event.dart';

abstract class AddEventDataSource {
  Future<Either<Failures, void>> createEvent(Event event);
}
