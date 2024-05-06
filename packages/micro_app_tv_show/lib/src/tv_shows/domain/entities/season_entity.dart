import 'package:micro_dependencies/micro_dependencies.dart';

class SeasonEntity extends Equatable {
  const SeasonEntity({
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.seasonNumber,
    required this.voteAverage,
    this.airDate,
    this.posterPath,
  });

  final DateTime? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final double voteAverage;

  @override
  String toString() {
    return 'SeasonEntity(airDate: $airDate,'
        ' episodeCount: $episodeCount,'
        ' id: $id,'
        ' name: $name,'
        ' overview: $overview,'
        ' posterPath: $posterPath,'
        ' seasonNumber: $seasonNumber,'
        ' voteAverage: $voteAverage)';
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}
