import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/tv_show_details_entity.dart';
import '../repositories/i_tv_show_repository.dart';

class GetTVShowDetailsUseCase {
  final ITVShowRepository _repository;

  GetTVShowDetailsUseCase(this._repository);

  Future<Either<Exception, TVShowDetailsEntity>> call(int id) async {
    return _repository.getDetails(id);
  }
}