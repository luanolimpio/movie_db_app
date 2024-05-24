import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/tv_show_type_enum.dart';
import '../../domain/entities/tv_show_details_entity.dart';
import '../../domain/entities/tv_show_entity.dart';
import '../../domain/repositories/i_tv_show_repository.dart';
import '../datasources/i_tv_show_datasource.dart';

class TVShowRepository implements ITVShowRepository {
  final ITVShowDatasource _dataSource;

  TVShowRepository(this._dataSource);

  @override
  Future<Either<Exception, TVShowEntity>> getList({
    required TVShowTypeEnum type,
    required int page,
    bool useCache = false,
  }) async {
    return await _dataSource.getList(
      type: type,
      page: page,
      useCache: useCache,
    );
  }

  @override
  Future<Either<Exception, TVShowDetailsEntity>> getDetails(int id) async {
    return await _dataSource.getDetails(id);
  }
}
