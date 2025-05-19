import 'package:dartz/dartz.dart';
import 'package:evently_app/core/errors/failures.dart';
import 'package:evently_app/features/add_event/data/data_sources/add_event_data_source.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:evently_app/features/add_event/data/repositories/add_event_repo.dart';

class AddEventRepositoryImpl implements AddEventRepository {
  AddEventRepositoryImpl({required this.dataSource});

  final AddEventDataSource dataSource;

  @override
  Future<Either<Failures, void>> createEvent(Event event) async {
    return await dataSource.createEvent(event);
  }
}
