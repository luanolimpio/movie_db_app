import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/movie_type_enum.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';

abstract class IMovieRepository {
  Future<Either<Exception, MovieEntity>> getList({
    required MovieTypeEnum type,
    required int page,
    bool useCache = false,
  });

  Future<Either<Exception, MovieDetailsEntity>> getDetails(int id);
}
