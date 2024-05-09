import 'package:dartz/dartz.dart';
import 'package:micro_app_person/src/people/domain/entities/person_details_entity.dart';

import '../../domain/entities/person_entity.dart';
import '../../domain/repositories/i_person_repository.dart';
import '../datasources/i_person_datasource.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _dataSource;

  PersonRepository(this._dataSource);

  @override
  Future<Either<Exception, PersonEntity>> getList({required int page}) async {
    return await _dataSource.getList(page: page);
  }

  @override
  Future<Either<Exception, PersonDetailsEntity>> getDetails(int id) async {
    return await _dataSource.getDetails(id);
  }
}
