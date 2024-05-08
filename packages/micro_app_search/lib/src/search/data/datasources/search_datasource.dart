import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/multi_search_entity.dart';
import '../models/multi_search_model.dart';
import 'i_search_datasource.dart';

class SearchDatasource implements ISearchDatasource {
  final Dio _dioClient;

  SearchDatasource(this._dioClient);

  @override
  Future<Either<Exception, List<MultiSearchEntity>>> call(String query) async {
    try {
      final result = await _dioClient.get(
        'search/multi?query=$query&api_key=${APIInfo.key}&language=${APIInfo.language}',
      );
      if (result.statusCode == 200) {
        final List<MultiSearchEntity> list = (result.data['results'] as List)
            .map((dynamic json) => MultiSearchModel.fromJson(json))
            .toList();
        return Right(list);
      }
      return Left(
        ApiException(
          'Não foi possível realizar a busca. Por favor, tente novamente.',
        ),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}