import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';

abstract class IMovieRepository {
  Future<Either<Exception, List<MovieEntity>>> getNowPlaying();

  Future<Either<Exception, MovieDetailsEntity>> getDetails(int id);
}
