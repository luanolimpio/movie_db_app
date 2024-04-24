import 'package:micro_common/micro_common.dart';

import '../../../core/enums/status_enum.dart';
import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.adult,
    required super.backdropPath,
    required super.budget,
    required super.genres,
    required super.id,
    required super.imdbId,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

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
      releaseDate: (map['release_date'] as String).toDateTime!,
      revenue: map['revenue'],
      runtime: map['runtime'],
      status: getStatusEnum(map['status']),
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      voteAverage: (map['vote_average'] as num).toDouble(),
      voteCount: map['vote_count'],
    );
  }
}
