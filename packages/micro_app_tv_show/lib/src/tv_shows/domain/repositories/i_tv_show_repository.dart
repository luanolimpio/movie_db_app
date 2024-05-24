import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/tv_show_type_enum.dart';
import '../entities/tv_show_details_entity.dart';
import '../entities/tv_show_entity.dart';

abstract class ITVShowRepository {
  Future<Either<Exception, TVShowEntity>> getList({
    required TVShowTypeEnum type,
    required int page,
    bool useCache = false,
  });

  Future<Either<Exception, TVShowDetailsEntity>> getDetails(int id);
}
