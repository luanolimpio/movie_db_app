import 'package:micro_dependencies/micro_dependencies.dart';

import '../entities/movie_details_entity.dart';
import '../repositories/i_movie_repository.dart';

class GetMovieDetailsUseCase {
  final IMovieRepository _repository;

  GetMovieDetailsUseCase(this._repository);

  Future<Either<Exception, MovieDetailsEntity>> call(int id) async {
    return _repository.getDetails(id);
  }
}
