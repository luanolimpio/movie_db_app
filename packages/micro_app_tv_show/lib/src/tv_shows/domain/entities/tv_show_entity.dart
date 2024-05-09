import 'package:micro_dependencies/micro_dependencies.dart';

import 'tv_show_result_entity.dart';

class TVShowEntity extends Equatable {
  const TVShowEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<TVShowResultEntity> results;
  final int totalPages;
  final int totalResults;

  @override
  String toString() {
    return 'TVShowEntity(page: $page,'
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
