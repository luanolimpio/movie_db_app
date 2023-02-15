import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_entity.dart';

abstract class IMovieDatasource {
  Future<Either<Exception, List<MovieEntity>>> getNowPlaying();

  Future<Either<Exception, MovieDetailsEntity>> getDetails(int id);
}
