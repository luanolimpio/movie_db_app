import 'package:micro_common/micro_common.dart';

import '../../domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.airDate,
    required super.episodeNumber,
    required super.productionCode,
    required super.seasonNumber,
    required super.showId,
    super.runtime,
    super.stillPath,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> map) {
    return EpisodeModel(
      id: map['id'],
      name: map['name'],
      overview: map['overview'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
      airDate: (map['air_date'] as String).toDateTime!,
      episodeNumber: map['episode_number'],
      productionCode: map['production_code'],
      runtime: map['runtime'],
      seasonNumber: map['season_number'],
      showId: map['show_id'],
      stillPath: map['still_path'],
    );
  }
}
