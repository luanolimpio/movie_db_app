import 'package:micro_common/micro_common.dart';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.posterPath,
    required super.adult,
    required super.overview,
    required super.releaseDate,
    required super.genreIds,
    required super.id,
    required super.originalTitle,
    required super.originalLanguage,
    required super.title,
    required super.backdropPath,
    required super.popularity,
    required super.voteCount,
    required super.video,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      posterPath: map['poster_path'],
      adult: map['adult'],
      overview: map['overview'],
      releaseDate: (map['release_date'] as String).toDateTime!,
      genreIds: map['genre_ids'].cast<int>(),
      id: map['id'],
      originalTitle: map['original_title'],
      originalLanguage: map['original_language'],
      title: map['title'],
      backdropPath: map['backdrop_path'],
      popularity: map['popularity'],
      voteCount: map['vote_count'],
      video: map['video'],
      voteAverage: (map['vote_average'] as num).toDouble(),
    );
  }
}
