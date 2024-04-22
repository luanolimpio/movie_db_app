import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/movie_entity.dart';
import '../repositories/i_movie_repository.dart';

class GetMoviesNowPlayingUseCase {
  final IMovieRepository _repository;

  GetMoviesNowPlayingUseCase(this._repository);

  Future<Either<Exception, List<MovieEntity>>> call() async {
    return _repository.getNowPlaying();
  }
}
