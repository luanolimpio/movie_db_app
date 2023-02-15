import 'package:micro_common/micro_common.dart';

import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/movie_details_entity.dart';
import 'genre_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required bool adult,
    required String backdropPath,
    required int budget,
    required List<GenreEntity> genres,
    required int id,
    required String imdbId,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String? posterPath,
    required DateTime releaseDate,
    required int revenue,
    required int runtime,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          budget: budget,
          genres: genres,
          id: id,
          imdbId: imdbId,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          status: status,
          tagline: tagline,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> map) {
    return MovieDetailsModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      budget: map['budget'],
      genres:
          List.from(map['genres']).map((e) => GenreModel.fromJson(e)).toList(),
      id: map['id'],
      imdbId: map['imdb_id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      releaseDate: (map['release_date'] as String).toDateTime,
      revenue: map['revenue'],
      runtime: map['runtime'],
      status: map['status'],
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      voteAverage: (map['vote_average'] as num).toDouble(),
      voteCount: map['vote_count'],
    );
  }
}
