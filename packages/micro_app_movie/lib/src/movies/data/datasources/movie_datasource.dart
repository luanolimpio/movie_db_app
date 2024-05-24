import 'package:micro_app_movie/src/movies/domain/entities/movie_details_entity.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_entity.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/movie_type_enum.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import 'i_movie_datasource.dart';

class MovieDatasource implements IMovieDatasource {
  final Dio _dioClient;

  MovieDatasource(this._dioClient);

  @override
  Future<Either<Exception, MovieEntity>> getList({
    required MovieTypeEnum type,
    required int page,
    bool useCache = false,
  }) async {
    try {
      final result = await _dioClient.get(
        'movie/${type.path}?api_key=${APIInfo.key}&language=${APIInfo.language}&page=$page',
        options: Options(
          extra: {
            'useCache': useCache,
          },
        ),
      );
      if (result.statusCode == 200) {
        return Right(MovieModel.fromJson(result.data));
      }
      return Left(
        ApiException(
          'Não foi possível buscar os filmes. Por favor, tente novamente.',
        ),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<Exception, MovieDetailsEntity>> getDetails(int id) async {
    try {
      final result = await _dioClient.get(
        'movie/$id?api_key=${APIInfo.key}&language=${APIInfo.language}',
      );
      if (result.statusCode == 200) {
        return Right(MovieDetailsModel.fromJson(result.data));
      }
      return Left(
        ApiException(
          'Não foi possível buscar os detalhes. Por favor, tente novamente.',
        ),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
