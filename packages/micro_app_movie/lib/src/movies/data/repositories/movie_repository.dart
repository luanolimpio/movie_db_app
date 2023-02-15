import 'package:micro_app_movie/src/movies/domain/entities/movie_details_entity.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_entity.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/repositories/i_movie_repository.dart';
import '../datasources/i_movie_datasource.dart';

class MovieRepository implements IMovieRepository {
  final IMovieDatasource _dataSource;

  MovieRepository(this._dataSource);

  @override
  Future<Either<Exception, List<MovieEntity>>> getNowPlaying() async {
    return await _dataSource.getNowPlaying();
  }

  @override
  Future<Either<Exception, MovieDetailsEntity>> getDetails(int id) async {
    return await _dataSource.getDetails(id);
  }
}
