import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/multi_search_entity.dart';
import '../../domain/repositories/i_search_repository.dart';
import '../datasources/i_search_datasource.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDatasource _dataSource;

  SearchRepository(this._dataSource);

  @override
  Future<Either<Exception, List<MultiSearchEntity>>> call(String query) async {
    return await _dataSource(query);
  }
}
