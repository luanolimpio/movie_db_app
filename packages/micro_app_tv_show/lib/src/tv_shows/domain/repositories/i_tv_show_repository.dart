import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/tv_show_details_entity.dart';
import '../entities/tv_show_entity.dart';

abstract class ITVShowRepository {
  Future<Either<Exception, List<TVShowEntity>>> getOnTheAir();

  Future<Either<Exception, TVShowDetailsEntity>> getDetails(int id);
}
