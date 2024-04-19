import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/tv_show_entity.dart';

abstract class ITVShowDatasource {
  Future<Either<Exception, List<TVShowEntity>>> getOnTheAir();
}
