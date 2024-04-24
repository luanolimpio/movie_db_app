import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/status_enum.dart';

class MovieDetailsEntity extends Equatable {
  const MovieDetailsEntity({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final int budget;
  final List<GenreEntity> genres;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final StatusEnum status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  @override
  String toString() {
    return 'MovieDetailsEntity(adult: $adult,'
        ' backdropPath: $backdropPath,'
        ' budget: $budget,'
        ' genres: $genres,'
        ' id: $id,'
        ' imdbId: $imdbId,'
        ' originalLanguage: $originalLanguage,'
        ' originalTitle: $originalTitle,'
        ' overview: $overview,'
        ' popularity: $popularity,'
        ' posterPath: $posterPath,'
        ' releaseDate: $releaseDate,'
        ' revenue: $revenue,'
        ' runtime: $runtime,'
        ' status: $status,'
        ' tagline: $tagline,'
        ' title: $title,'
        ' video: $video,'
        ' voteAverage: $voteAverage,'
        ' voteCount: $voteCount)';
  }

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    budget,
    genres,
    id,
    imdbId,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    revenue,
    runtime,
    status,
    tagline,
    title,
    video,
    voteAverage,
    voteCount,
  ];
}