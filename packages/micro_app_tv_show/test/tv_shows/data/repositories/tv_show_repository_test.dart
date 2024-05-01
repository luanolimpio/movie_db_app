import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/core/enums/status_enum.dart';
import 'package:micro_app_tv_show/src/core/enums/tv_show_type_enum.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/datasources/i_tv_show_datasource.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/repositories/tv_show_repository.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/created_by_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/episode_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/network_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/season_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_details_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_entity.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockTVShowDatasource extends Mock implements ITVShowDatasource {}

void main() {
  late MockTVShowDatasource datasource;
  late TVShowRepository repository;

  setUp(() {
    datasource = MockTVShowDatasource();
    repository = TVShowRepository(datasource);
  });

  const tId = 1399;

  final tListTVShowEntity = [
    TVShowEntity(
      backdropPath: '/mAJ84W6I8I272Da87qplS2Dp9ST.jpg',
      firstAirDate: DateTime.now(),
      genreIds: const [9648, 18],
      id: 202250,
      name: 'Dirty Linen',
      originCountry: const ['PH'],
      originalLanguage: 'tl',
      originalName: 'Dirty Linen',
      overview:
          'To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.',
      popularity: 2797.914,
      posterPath: '/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg',
      voteAverage: 5,
      voteCount: 13,
    ),
  ];

  final tTVShowDetailsEntity = TVShowDetailsEntity(
    adult: false,
    backdropPath: '/6LWy0jvMpmjoS9fojNgHIKoWL05.jpg',
    createdBy: const [
      CreatedByEntity(
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
      GenreEntity(id: 18, name: 'Drama'),
    ],
    homepage: 'http://www.hbo.com/game-of-thrones',
    id: 1399,
    inProduction: false,
    languages: const ['en'],
    lastAirDate: DateTime.now(),
    lastEpisodeToAir: EpisodeEntity(
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
      NetworkEntity(
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
      SeasonEntity(
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
    status: StatusEnum.ended,
    tagline: 'Winter Is Coming',
    type: 'Scripted',
    voteAverage: 8.438,
    voteCount: 21390,
  );

  const tType = TVShowTypeEnum.onTheAir;

  group('getList', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getList(tType))
          .thenAnswer((_) async => Right(tListTVShowEntity));
      final result = await repository.getList(tType);
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource.getList(tType))
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository.getList(tType);
      expect(result.isLeft(), true);
    });
  });

  group('getDetails', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getDetails(tId))
          .thenAnswer((_) async => Right(tTVShowDetailsEntity));
      final result = await repository.getDetails(tId);
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource.getDetails(tId))
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository.getDetails(tId);
      expect(result.isLeft(), true);
    });
  });
}
