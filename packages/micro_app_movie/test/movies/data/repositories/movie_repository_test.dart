import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/core/enums/status_enum.dart';
import 'package:micro_app_movie/src/movies/data/datasources/i_movie_datasource.dart';
import 'package:micro_app_movie/src/movies/data/repositories/movie_repository.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_details_entity.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_entity.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockMovieDatasource extends Mock implements IMovieDatasource {}

void main() {
  late MockMovieDatasource datasource;
  late MovieRepository repository;

  setUp(() {
    datasource = MockMovieDatasource();
    repository = MovieRepository(datasource);
  });

  const tId = 297761;

  final tListMovieEntity = [
    MovieEntity(
      posterPath: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
      adult: false,
      overview:
      'From DC Comics comes the Suicide Squad, an antihero team of incarcerated',
      releaseDate: DateTime.now(),
      genreIds: const [14, 28, 80],
      id: 297761,
      originalTitle: 'Suicide Squad',
      originalLanguage: 'en',
      title: 'Suicide Squad',
      backdropPath: '/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jp',
      popularity: 48.261451,
      voteCount: 1466,
      video: false,
      voteAverage: 5.91,
    ),
  ];

  final tMovieDetailsEntity = MovieDetailsEntity(
    adult: false,
    backdropPath: '/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg',
    budget: 63000000,
    genres: const [
      GenreEntity(id: 18, name: 'Action'),
    ],
    id: 297761,
    imdbId: 'tt0137523',
    originalLanguage: 'en',
    originalTitle: 'Suicide Squad',
    overview:
    'From DC Comics comes the Suicide Squad, an antihero team of incarcerated',
    popularity: 48.261451,
    posterPath: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
    releaseDate: DateTime.now(),
    revenue: 100853753,
    runtime: 139,
    status: StatusEnum.released,
    tagline: 'How much can you know about yourself?',
    title: 'Suicide Squad',
    video: false,
    voteAverage: 5.91,
    voteCount: 1466,
  );

  group('getNowPlaying', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getNowPlaying())
          .thenAnswer((_) async => Right(tListMovieEntity));
      final result = await repository.getNowPlaying();
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource.getNowPlaying())
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository.getNowPlaying();
      expect(result.isLeft(), true);
    });
  });

  group('getDetails', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getDetails(tId))
          .thenAnswer((_) async => Right(tMovieDetailsEntity));
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
