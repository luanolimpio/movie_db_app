import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/created_by_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/last_episode_to_air_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/network_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/season_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/tv_show_details_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_details_entity.dart';
import 'package:micro_common/micro_common.dart';

void main() {
  final tTVShowDetailsModel = TVShowDetailsModel(
    adult: false,
    backdropPath: '/6LWy0jvMpmjoS9fojNgHIKoWL05.jpg',
    createdBy: const [
      CreatedByModel(
        id: 9813,
        creditId: '5256c8c219c2956ff604858a',
        name: 'David Benioff',
        gender: 2,
        profilePath: '/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg',
      ),
    ],
    episodeRunTime: const [60],
    firstAirDate: DateTime.now(),
    genres: const [
      GenreModel(id: 18, name: 'Drama'),
    ],
    homepage: 'http://www.hbo.com/game-of-thrones',
    id: 1399,
    inProduction: false,
    languages: const ['en'],
    lastAirDate: DateTime.now(),
    lastEpisodeToAir: LastEpisodeToAirModel(
      id: 1551830,
      name: 'The Iron Throne',
      overview:
          'In the aftermath of the devastating attack on King\'s Landing, Daenerys must face the survivors.',
      voteAverage: 4.809,
      voteCount: 241,
      airDate: DateTime.now(),
      episodeNumber: 6,
      productionCode: '806',
      runtime: 80,
      seasonNumber: 8,
      showId: 1399,
      stillPath: '/zBi2O5EJfgTS6Ae0HdAYLm9o2nf.jpg',
    ),
    name: 'Game of Thrones',
    networks: const [
      NetworkModel(
        id: 49,
        logoPath: '/tuomPhY2UtuPTqqFnKMVHvSb724.png',
        name: 'HBO',
        originCountry: 'US',
      )
    ],
    numberOfEpisodes: 73,
    numberOfSeasons: 8,
    originCountry: const ['US'],
    originalLanguage: 'en',
    originalName: 'Game of Thrones',
    overview:
        'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.',
    popularity: 346.098,
    posterPath: '/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg',
    seasons: [
      SeasonModel(
        airDate: DateTime.now(),
        episodeCount: 10,
        id: 3624,
        name: 'Season 1',
        overview:
            'Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros',
        posterPath: '/wgfKiqzuMrFIkU1M68DDDY8kGC1.jpg',
        seasonNumber: 1,
        voteAverage: 8.3,
      ),
    ],
    status: 'Ended',
    tagline: 'Winter Is Coming',
    type: 'Scripted',
    voteAverage: 8.438,
    voteCount: 21390,
  );

  const tJson = '{"adult": false,"backdrop_path": "/6LWy0jvMpmjoS9fojNgHIKoWL05.jpg","created_by": [{"id": 9813,"credit_id": "5256c8c219c2956ff604858a","name": "David Benioff","gender": 2,"profile_path": "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg"}],"episode_run_time": [60],"first_air_date": "2011-04-17","genres": [{"id": 18,"name": "Drama"}],"homepage": "http://www.hbo.com/game-of-thrones","id": 1399,"in_production": false,"languages": ["en"],"last_air_date": "2019-05-19","last_episode_to_air": {"id": 1551830,"name": "The Iron Throne","overview": "In the aftermath of the devastating attack on King\'s Landing, Daenerys must face the survivors.","vote_average": 4.809,"vote_count": 241 ,"air_date": "2019-05-19" ,"episode_number": 6 ,"production_code": "806" ,"runtime": 80 ,"season_number": 8 ,"show_id": 1399 ,"still_path": "/zBi2O5EJfgTS6Ae0HdAYLm9o2nf.jpg"},"name": "Game of Thrones","networks": [{"id": 49,"logo_path": "/tuomPhY2UtuPTqqFnKMVHvSb724.png","name": "HBO","origin_country": "US"}],"number_of_episodes": 73,"number_of_seasons": 8,"origin_country": ["US"],"original_language": "en","original_name": "Game of Thrones","overview": "Seven noble families fight for control","popularity": 346.098,"seasons": [{"air_date": "2011-04-17","episode_count": 10,"id": 3624,"name": "Season 1","overview": "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros","poster_path": "/wgfKiqzuMrFIkU1M68DDDY8kGC1.jpg","season_number": 1,"vote_average": 8.3}],"status": "Ended","tagline": "Winter Is Coming","type": "Scripted","vote_average": 8.438,"vote_count": 21390}';

  test('Should be a subclass of TVShowDetailsEntity', () {
    expect(tTVShowDetailsModel, isA<TVShowDetailsEntity>());
  });

  test('Should return a valid TVShowDetailsModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = TVShowDetailsModel.fromJson(jsonMap);
    expect(result, isA<TVShowDetailsEntity>());
  });
}
