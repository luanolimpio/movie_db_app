import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/episode_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/episode_entity.dart';

void main() {
  final tLastEpisodeToAirModel = EpisodeModel(
    id: 1551830,
    name: 'The Iron Throne',
    overview: 'In the aftermath of the devastating attack on King\'s Landing, Daenerys must face the survivors.',
    voteAverage: 4.809,
    voteCount: 241,
    airDate: DateTime.now(),
    episodeNumber: 6,
    productionCode: '806',
    runtime: 80,
    seasonNumber: 8,
    showId: 1399,
    stillPath: '/zBi2O5EJfgTS6Ae0HdAYLm9o2nf.jpg',
  );

  const tJson = '{"id": 1551830,"name": "The Iron Throne","overview": "In the aftermath of the devastating attack on King\'s Landing, Daenerys must face the survivors.","vote_average": 4.809,"vote_count": 241 ,"air_date": "2019-05-19" ,"episode_number": 6 ,"production_code": "806" ,"runtime": 80 ,"season_number": 8 ,"show_id": 1399 ,"still_path": "/zBi2O5EJfgTS6Ae0HdAYLm9o2nf.jpg"}';

  test('Should be a subclass of LastEpisodeToAirEntity', () {
    expect(tLastEpisodeToAirModel, isA<EpisodeEntity>());
  });

  test('Should return a valid LastEpisodeToAirModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = EpisodeModel.fromJson(jsonMap);
    expect(result, isA<EpisodeEntity>());
  });
}
