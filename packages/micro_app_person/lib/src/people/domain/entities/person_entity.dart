import 'package:micro_dependencies/micro_dependencies.dart';

import 'person_result_entity.dart';

class PersonEntity extends Equatable {
  const PersonEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<PersonResultEntity> results;
  final int totalPages;
  final int totalResults;

  @override
  String toString() {
    return 'PersonEntity(page: $page,'
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
