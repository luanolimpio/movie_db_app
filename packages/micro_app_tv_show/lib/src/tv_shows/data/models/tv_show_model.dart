import '../../domain/entities/tv_show_entity.dart';
import 'tv_show_result_model.dart';

class TVShowModel extends TVShowEntity {
  const TVShowModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory TVShowModel.fromJson(Map<String, dynamic> map) {
    return TVShowModel(
      page: map['page'],
      results: map['results'] == null
          ? []
          : List.from(map['results'])
              .map((e) => TVShowResultModel.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
      totalPages: map['total_pages'],
      totalResults: map['total_results'],
    );
  }
}
