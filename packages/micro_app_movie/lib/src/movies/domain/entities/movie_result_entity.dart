import 'package:micro_dependencies/micro_dependencies.dart';

class MovieResultEntity extends Equatable {
  const MovieResultEntity({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
    this.backdropPath,
  });

  final String posterPath;
  final bool adult;
  final String overview;
  final DateTime releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  @override
  String toString() {
    return 'MovieResultEntity(posterPath: $posterPath,'
        ' adult: $adult,'
        ' overview: $overview,'
        ' releaseDate: $releaseDate,'
        ' genreIds: $genreIds,'
        ' id: $id,'
        ' originalTitle: $originalTitle,'
        ' originalLanguage: $originalLanguage,'
        ' title: $title,'
        ' backdropPath: $backdropPath,'
        ' popularity: $popularity,'
        ' voteCount: $voteCount,'
        ' video: $video,'
        ' voteAverage: $voteAverage)';
  }

  @override
  List<Object?> get props => [
        posterPath,
        adult,
        overview,
        releaseDate,
        genreIds,
        id,
        originalTitle,
        originalLanguage,
        title,
        backdropPath,
        popularity,
        voteCount,
        video,
        voteAverage,
      ];
}
