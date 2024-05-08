import 'package:micro_common/micro_common.dart';

import '../../domain/entities/season_entity.dart';

class SeasonModel extends SeasonEntity {
  const SeasonModel({
    required super.episodeCount,
    required super.id,
    required super.name,
    required super.overview,
    required super.seasonNumber,
    required super.voteAverage,
    super.airDate,
    super.posterPath,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> map) {
    return SeasonModel(
      airDate: (map['air_date'] as String?)?.toDateTime,
      episodeCount: map['episode_count'],
      id: map['id'],
      name: map['name'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      seasonNumber: map['season_number'],
      voteAverage: map['vote_average'],
    );
  }
}
