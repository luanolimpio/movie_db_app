import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/person_details_entity.dart';
import '../repositories/i_person_repository.dart';

class GetPersonDetailsUseCase {
  final IPersonRepository _repository;

  GetPersonDetailsUseCase(this._repository);

  Future<Either<Exception, PersonDetailsEntity>> call(int id) async {
    return _repository.getDetails(id);
  }
}