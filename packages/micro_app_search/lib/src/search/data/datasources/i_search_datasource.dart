import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/multi_search_entity.dart';

abstract class ISearchDatasource {
  Future<Either<Exception, List<MultiSearchEntity>>> call(String query);
}