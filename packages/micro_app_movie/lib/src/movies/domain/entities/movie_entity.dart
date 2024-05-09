import 'package:micro_dependencies/micro_dependencies.dart';

import 'movie_result_entity.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieResultEntity> results;
  final int totalPages;
  final int totalResults;

  @override
  String toString() {
    return 'MovieEntity(page: $page,'
        ' results: $results,'
        ' totalPages: $totalPages,'
        ' totalResults: $totalResults)';
  }

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
