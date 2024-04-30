import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/movie_type_enum.dart';
import '../entities/movie_entity.dart';
import '../repositories/i_movie_repository.dart';

class GetMoviesUseCase {
  final IMovieRepository _repository;

  GetMoviesUseCase(this._repository);

  Future<Either<Exception, List<MovieEntity>>> call(MovieTypeEnum type) async {
    return _repository.getList(type);
  }
}
