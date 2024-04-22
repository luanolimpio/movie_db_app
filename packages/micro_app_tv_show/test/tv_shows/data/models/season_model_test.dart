import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/season_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/season_entity.dart';

void main() {
  final tSeasonModel = SeasonModel(
    airDate: DateTime.now(),
    episodeCount: 10,
    id: 3624,
    name: 'Season 1',
    overview: 'Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros',
    posterPath: '/wgfKiqzuMrFIkU1M68DDDY8kGC1.jpg',
    seasonNumber: 1,
    voteAverage: 8.3,
  );

  const tJson = '{"air_date": "2011-04-17","episode_count": 10,"id": 3624,"name": "Season 1","overview": "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros","poster_path": "/wgfKiqzuMrFIkU1M68DDDY8kGC1.jpg","season_number": 1,"vote_average": 8.3}';

  test('Should be a subclass of SeasonEntity', () {
    expect(tSeasonModel, isA<SeasonEntity>());
  });

  test('Should return a valid SeasonModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = SeasonModel.fromJson(jsonMap);
    expect(result, isA<SeasonEntity>());
  });
}
