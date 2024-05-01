import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/tv_show_type_enum.dart';
import '../../domain/entities/tv_show_details_entity.dart';
import '../../domain/entities/tv_show_entity.dart';

abstract class ITVShowDatasource {
  Future<Either<Exception, List<TVShowEntity>>> getList(TVShowTypeEnum type);

  Future<Either<Exception, TVShowDetailsEntity>> getDetails(int id);
}
