import 'package:micro_dependencies/micro_dependencies.dart';

class EpisodeEntity extends Equatable {
  const EpisodeEntity({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  final int id;
  final String name;
  final String overview;
  final double voteAverage;
  final int voteCount;
  final DateTime airDate;
  final int episodeNumber;
  final String productionCode;
  final int? runtime;
  final int seasonNumber;
  final int showId;
  final String? stillPath;

  @override
  String toString() {
    return 'EpisodeEntity(id: $id,'
        ' name: $name,'
        ' overview: $overview,'
        ' voteAverage: $voteAverage,'
        ' voteCount: $voteCount,'
        ' airDate: $airDate,'
        ' episodeNumber: $episodeNumber,'
        ' productionCode: $productionCode,'
        ' runtime: $runtime,'
        ' seasonNumber: $seasonNumber,'
        ' showId: $showId,'
        ' stillPath: $stillPath)';
  }

  @override
  List<Object?> get props => [
    id,
    name,
    overview,
    voteAverage,
    voteCount,
    airDate,
    episodeNumber,
    productionCode,
    runtime,
    seasonNumber,
    showId,
    stillPath,
  ];
}