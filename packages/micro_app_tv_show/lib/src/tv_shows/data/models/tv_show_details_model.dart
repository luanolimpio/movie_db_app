import 'package:micro_common/micro_common.dart';

import '../../../core/enums/status_enum.dart';
import '../../domain/entities/tv_show_details_entity.dart';
import 'created_by_model.dart';
import 'episode_model.dart';
import 'network_model.dart';
import 'season_model.dart';

class TVShowDetailsModel extends TVShowDetailsEntity {
  const TVShowDetailsModel({
    required super.adult,
    required super.backdropPath,
    required super.createdBy,
    required super.episodeRunTime,
    required super.firstAirDate,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.inProduction,
    required super.languages,
    required super.lastAirDate,
    required super.lastEpisodeToAir,
    required super.name,
    required super.networks,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalName,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.seasons,
    required super.status,
    required super.tagline,
    required super.type,
    required super.voteAverage,
    required super.voteCount,
  });

  factory TVShowDetailsModel.fromJson(Map<String, dynamic> map) {
    return TVShowDetailsModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      createdBy: List.from(map['created_by'])
          .map((e) => CreatedByModel.fromJson(e))
          .toList(),
      episodeRunTime: map['episode_run_time'].cast<int>(),
      firstAirDate: (map['first_air_date'] as String?)?.toDateTime,
      genres:
          List.from(map['genres']).map((e) => GenreModel.fromJson(e)).toList(),
      homepage: map['homepage'],
      id: map['id'],
      inProduction: map['in_production'],
      languages: map['languages'].cast<String>(),
      lastAirDate: (map['last_air_date'] as String?)?.toDateTime,
      lastEpisodeToAir: map['last_episode_to_air'] != null
          ? EpisodeModel.fromJson(map['last_episode_to_air'])
          : null,
      name: map['name'],
      networks: List.from(map['networks'])
          .map((e) => NetworkModel.fromJson(e))
          .toList(),
      numberOfEpisodes: map['number_of_episodes'],
      numberOfSeasons: map['number_of_seasons'],
      originCountry: map['origin_country'].cast<String>(),
      originalLanguage: map['original_language'],
      originalName: map['original_name'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
      seasons: List.from(map['seasons'])
          .map((e) => SeasonModel.fromJson(e))
          .toList(),
      status: getStatusEnum(map['status']),
      tagline: map['tagline'],
      type: map['type'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }
}
