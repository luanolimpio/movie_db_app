import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/status_enum.dart';
import 'created_by_entity.dart';
import 'last_episode_to_air_entity.dart';
import 'network_entity.dart';
import 'season_entity.dart';

class TVShowDetailsEntity extends Equatable {
  const TVShowDetailsEntity({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<CreatedByEntity> createdBy;
  final List<int> episodeRunTime;
  final DateTime? firstAirDate;
  final List<GenreEntity> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final LastEpisodeToAirEntity lastEpisodeToAir;
  final String name;
  final List<NetworkEntity> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<SeasonEntity> seasons;
  final StatusEnum status;
  final String tagline;
  final String type;
  final double voteAverage;
  final int voteCount;

  @override
  String toString() {
    return 'TVShowDetailsEntity(adult: $adult,'
        ' backdropPath: $backdropPath,'
        ' createdBy: $createdBy,'
        ' episodeRunTime: $episodeRunTime,'
        ' firstAirDate: $firstAirDate,'
        ' genres: $genres,'
        ' homepage: $homepage,'
        ' id: $id,'
        ' inProduction: $inProduction,'
        ' languages: $languages,'
        ' lastAirDate: $lastAirDate,'
        ' lastEpisodeToAir: $lastEpisodeToAir,'
        ' name: $name,'
        ' networks: $networks,'
        ' numberOfEpisodes: $numberOfEpisodes,'
        ' numberOfSeasons: $numberOfSeasons,'
        ' originCountry: $originCountry,'
        ' originalLanguage: $originalLanguage,'
        ' originalName: $originalName,'
        ' overview: $overview,'
        ' popularity: $popularity,'
        ' posterPath: $posterPath,'
        ' seasons: $seasons,'
        ' status: $status,'
        ' tagline: $tagline,'
        ' type: $type,'
        ' voteAverage: $voteAverage,'
        ' voteCount: $voteCount)';
  }

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    createdBy,
    episodeRunTime,
    firstAirDate,
    genres,
    homepage,
    id,
    inProduction,
    languages,
    lastAirDate,
    lastEpisodeToAir,
    name,
    networks,
    numberOfEpisodes,
    numberOfSeasons,
    originCountry,
    originalLanguage,
    originalName,
    overview,
    popularity,
    posterPath,
    seasons,
    status,
    tagline,
    type,
    voteAverage,
    voteCount,
  ];
}