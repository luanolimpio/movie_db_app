import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_details_entity.dart';
import 'package:micro_app_movie/src/movies/domain/repositories/i_movie_repository.dart';
import 'package:micro_app_movie/src/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late MockMovieRepository repository;
  late GetMovieDetailsUseCase getMovieDetailsUseCase;

  setUp(() {
    repository = MockMovieRepository();
    getMovieDetailsUseCase = GetMovieDetailsUseCase(repository);
  });

  const tId = 297761;

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
    status: 'Released',
    tagline: 'How much can you know about yourself?',
    title: 'Suicide Squad',
    video: false,
    voteAverage: 5.91,
    voteCount: 1466,
  );

  test('Should return a MovieDetailsEntity when call repository', () async {
    when(() => repository.getDetails(tId)).thenAnswer((_) async => Right(tMovieDetailsEntity));
    final result = await getMovieDetailsUseCase(tId);
    expect(result, Right<Exception, MovieDetailsEntity>(tMovieDetailsEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getDetails(tId)).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getMovieDetailsUseCase(tId);
    expect(result.isLeft(), true);
  });
}
