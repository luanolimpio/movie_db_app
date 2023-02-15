import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_entity.dart';
import 'package:micro_app_movie/src/movies/domain/repositories/i_movie_repository.dart';
import 'package:micro_app_movie/src/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late MockMovieRepository repository;
  late GetNowPlayingUseCase getNowPlayingUseCase;

  setUp(() {
    repository = MockMovieRepository();
    getNowPlayingUseCase = GetNowPlayingUseCase(repository);
  });

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

  test('Should return a MovieEntity when call repository', () async {
    when(() => repository.getNowPlaying()).thenAnswer((_) async => Right(tListMovieEntity));
    final result = await getNowPlayingUseCase();
    expect(result, Right<Exception, List<MovieEntity>>(tListMovieEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getNowPlaying()).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getNowPlayingUseCase();
    expect(result.isLeft(), true);
  });
}
