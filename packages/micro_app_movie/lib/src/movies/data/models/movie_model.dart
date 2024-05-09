import '../../domain/entities/movie_entity.dart';
import 'movie_result_model.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      page: map['page'],
      results: map['results'] == null
          ? []
          : List.from(map['results'])
              .map((e) => MovieResultModel.fromJson(e))
              .toList(),
      totalPages: map['total_pages'],
      totalResults: map['total_results'],
    );
  }
}
