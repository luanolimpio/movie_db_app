import 'package:micro_dependencies/micro_dependencies.dart';

class TVShowEntity extends Equatable {
  const TVShowEntity({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    this.firstAirDate,
  });

  final String backdropPath;
  final DateTime? firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;

  @override
  String toString() {
    return 'TVShowEntity(backdropPath: $backdropPath,'
        ' firstAirDate: $firstAirDate,'
        ' genreIds: $genreIds,'
        ' id: $id,'
        ' name: $name,'
        ' originCountry: $originCountry,'
        ' originalLanguage: $originalLanguage,'
        ' originalName: $originalName,'
        ' overview: $overview,'
        ' popularity: $popularity,'
        ' posterPath: $posterPath,'
        ' voteAverage: $voteAverage,'
        ' voteCount: $voteCount)';
  }

  @override
  List<Object?> get props => [
        backdropPath,
        firstAirDate,
        genreIds,
        id,
        name,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
