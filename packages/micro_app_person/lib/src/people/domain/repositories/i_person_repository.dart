import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/person_details_entity.dart';
import '../entities/person_entity.dart';

abstract class IPersonRepository {
  Future<Either<Exception, PersonEntity>> getList({required int page});

  Future<Either<Exception, PersonDetailsEntity>> getDetails(int id);
}
