import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/core/enums/status_enum.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/created_by_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/last_episode_to_air_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/network_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/season_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_details_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/repositories/i_tv_show_repository.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/usecases/get_tv_show_details_usecase.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockTVShowRepository extends Mock implements ITVShowRepository {}

void main() {
  late MockTVShowRepository repository;
  late GetTVShowDetailsUseCase getTVShowDetailsUseCase;

  setUp(() {
    repository = MockTVShowRepository();
    getTVShowDetailsUseCase = GetTVShowDetailsUseCase(repository);
  });

  const tId = 1399;

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
    lastEpisodeToAir: LastEpisodeToAirEntity(
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

  test('Should return a TVShowDetailsEntity when call repository', () async {
    when(() => repository.getDetails(tId)).thenAnswer((_) async => Right(tTVShowDetailsEntity));
    final result = await getTVShowDetailsUseCase(tId);
    expect(result, Right<Exception, TVShowDetailsEntity>(tTVShowDetailsEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getDetails(tId)).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getTVShowDetailsUseCase(tId);
    expect(result.isLeft(), true);
  });
}