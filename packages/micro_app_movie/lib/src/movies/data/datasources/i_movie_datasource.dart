import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/movie_type_enum.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_entity.dart';

abstract class IMovieDatasource {
  Future<Either<Exception, List<MovieEntity>>> getList(MovieTypeEnum type);

  Future<Either<Exception, MovieDetailsEntity>> getDetails(int id);
}
