import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/person_entity.dart';
import '../repositories/i_person_repository.dart';

class GetPopularPeopleUseCase {
  final IPersonRepository _repository;

  GetPopularPeopleUseCase(this._repository);

  Future<Either<Exception, PersonEntity>> call({required int page}) async {
    return _repository.getList(page: page);
  }
}
