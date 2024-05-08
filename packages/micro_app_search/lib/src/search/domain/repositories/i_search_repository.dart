import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/multi_search_entity.dart';

abstract class ISearchRepository {
  Future<Either<Exception, List<MultiSearchEntity>>> call(String query);
}