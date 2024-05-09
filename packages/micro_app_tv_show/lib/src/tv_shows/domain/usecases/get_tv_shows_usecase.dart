import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/tv_show_type_enum.dart';
import '../entities/tv_show_entity.dart';
import '../repositories/i_tv_show_repository.dart';

class GetTVShowsUseCase {
  final ITVShowRepository _repository;

  GetTVShowsUseCase(this._repository);

  Future<Either<Exception, TVShowEntity>> call({
    required TVShowTypeEnum type,
    required int page,
  }) async {
    return _repository.getList(type: type, page: page);
  }
}
