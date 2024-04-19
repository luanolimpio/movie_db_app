import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/tv_show_entity.dart';
import '../repositories/i_tv_show_repository.dart';

class GetOnTheAirUseCase {
  final ITVShowRepository _repository;

  GetOnTheAirUseCase(this._repository);

  Future<Either<Exception, List<TVShowEntity>>> call() async {
    return _repository.getOnTheAir();
  }
}
