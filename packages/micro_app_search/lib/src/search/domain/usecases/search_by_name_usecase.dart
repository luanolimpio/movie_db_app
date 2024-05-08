import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/multi_search_entity.dart';
import '../repositories/i_search_repository.dart';

class SearchByNameUseCase {
  final ISearchRepository _repository;

  SearchByNameUseCase(this._repository);

  Future<Either<Exception, List<MultiSearchEntity>>> call(String query) async {
    return _repository(query);
  }
}
