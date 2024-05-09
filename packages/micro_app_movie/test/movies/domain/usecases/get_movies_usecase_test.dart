import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/core/enums/movie_type_enum.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_entity.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_result_entity.dart';
import 'package:micro_app_movie/src/movies/domain/repositories/i_movie_repository.dart';
import 'package:micro_app_movie/src/movies/domain/usecases/get_movies_usecase.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late MockMovieRepository repository;
  late GetMoviesUseCase getMoviesUseCase;

  setUp(() {
    repository = MockMovieRepository();
    getMoviesUseCase = GetMoviesUseCase(repository);
  });

  final tMovieEntity = MovieEntity(
    page: 1,
    results: [
      MovieResultEntity(
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
        backdropPath: '/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg',
        popularity: 48.261451,
        voteCount: 1466,
        video: false,
        voteAverage: 5.91,
      ),
    ],
    totalPages: 33,
    totalResults: 649,
  );

  const tType = MovieTypeEnum.nowPlaying;

  const tPage = 1;

  test('Should return a MovieEntity when call repository', () async {
    when(() => repository.getList(type: tType, page: tPage)).thenAnswer((_) async => Right(tMovieEntity));
    final result = await getMoviesUseCase(type: tType, page: tPage);
    expect(result, Right<Exception, MovieEntity>(tMovieEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getList(type: tType, page: tPage)).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getMoviesUseCase(type: tType, page: tPage);
    expect(result.isLeft(), true);
  });
}
