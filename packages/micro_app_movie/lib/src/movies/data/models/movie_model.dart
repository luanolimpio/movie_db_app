import 'package:micro_common/micro_common.dart';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required String posterPath,
    required bool adult,
    required String overview,
    required DateTime releaseDate,
    required List<int> genreIds,
    required int id,
    required String originalTitle,
    required String originalLanguage,
    required String title,
    required String backdropPath,
    required double popularity,
    required int voteCount,
    required bool video,
    required double voteAverage,
  }) : super(
          posterPath: posterPath,
          adult: adult,
          overview: overview,
          releaseDate: releaseDate,
          genreIds: genreIds,
          id: id,
          originalTitle: originalTitle,
          originalLanguage: originalLanguage,
          title: title,
          backdropPath: backdropPath,
          popularity: popularity,
          voteCount: voteCount,
          video: video,
          voteAverage: voteAverage,
        );

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      posterPath: map['poster_path'],
      adult: map['adult'],
      overview: map['overview'],
      releaseDate: (map['release_date'] as String).toDateTime,
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
