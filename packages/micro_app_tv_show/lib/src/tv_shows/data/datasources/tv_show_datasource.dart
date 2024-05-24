import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/tv_show_type_enum.dart';
import '../../domain/entities/tv_show_details_entity.dart';
import '../../domain/entities/tv_show_entity.dart';
import '../models/tv_show_details_model.dart';
import '../models/tv_show_model.dart';
import 'i_tv_show_datasource.dart';

class TVShowDatasource implements ITVShowDatasource {
  final Dio _dioClient;

  TVShowDatasource(this._dioClient);

  @override
  Future<Either<Exception, TVShowEntity>> getList({
    required TVShowTypeEnum type,
    required int page,
    bool useCache = false,
  }) async {
    try {
      final result = await _dioClient.get(
        'tv/${type.path}?api_key=${APIInfo.key}&language=${APIInfo.language}&page=$page',
        options: Options(
          extra: {
            'useCache': useCache,
          },
        ),
      );
      if (result.statusCode == 200) {
        return Right(TVShowModel.fromJson(result.data));
      }
      return Left(
        ApiException(
          'Não foi possível buscar as séries. Por favor, tente novamente.',
        ),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  @override
  Future<Either<Exception, TVShowDetailsEntity>> getDetails(int id) async {
    try {
      final result = await _dioClient.get(
        'tv/$id?api_key=${APIInfo.key}&language=${APIInfo.language}',
      );
      if (result.statusCode == 200) {
        return Right(TVShowDetailsModel.fromJson(result.data));
      }
      return Left(ApiException(
          'Não foi possível buscar os detalhes. Por favor, tente novamente.'));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
