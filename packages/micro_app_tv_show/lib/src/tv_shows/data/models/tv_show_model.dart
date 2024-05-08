import 'package:micro_common/micro_common.dart';

import '../../domain/entities/tv_show_entity.dart';

class TVShowModel extends TVShowEntity {
  const TVShowModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.name,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.voteAverage,
    required super.voteCount,
    super.firstAirDate,
  });

  factory TVShowModel.fromJson(Map<String, dynamic> map) {
    return TVShowModel(
      backdropPath: map['backdrop_path'],
      firstAirDate: (map['first_air_date'] as String).toDateTime,
      genreIds: map['genre_ids'].cast<int>(),
      id: map['id'],
      name: map['name'],
      originCountry: map['origin_country'].cast<String>(),
      originalLanguage: map['original_language'],
      originalName: map['original_name'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      voteAverage: (map['vote_average'] as num).toDouble(),
      voteCount: map['vote_count'],
    );
  }
}
