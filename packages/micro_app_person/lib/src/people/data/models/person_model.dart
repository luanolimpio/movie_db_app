import '../../domain/entities/person_entity.dart';
import 'person_result_model.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory PersonModel.fromJson(Map<String, dynamic> map) {
    return PersonModel(
      page: map['page'],
      results: map['results'] == null
          ? []
          : List.from(map['results'])
              .map((e) => PersonResultModel.fromJson(e))
              .toList(),
      totalPages: map['total_pages'],
      totalResults: map['total_results'],
    );
  }
}
