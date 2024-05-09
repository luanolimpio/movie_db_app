import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/person_details_entity.dart';
import '../../domain/entities/person_entity.dart';

abstract class IPersonDatasource {
  Future<Either<Exception, PersonEntity>> getList({required int page});

  Future<Either<Exception, PersonDetailsEntity>> getDetails(int id);
}
