import 'package:dartz/dartz.dart';

import '../../domain/entities/person_entity.dart';
import '../../domain/repositories/i_person_repository.dart';
import '../datasources/i_person_datasource.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _dataSource;

  PersonRepository(this._dataSource);

  @override
  Future<Either<Exception, List<PersonEntity>>> getList() async {
    return await _dataSource.getList();
  }
}
