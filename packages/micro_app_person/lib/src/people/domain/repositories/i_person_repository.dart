import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/person_entity.dart';

abstract class IPersonRepository {
  Future<Either<Exception, List<PersonEntity>>> getList();
}
