import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/core/enums/status_enum.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_details_entity.dart';
import 'package:micro_app_movie/src/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/details/movie_details_bloc.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/details/movie_details_event.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/details/movie_details_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetMovieDetailsUseCase extends Mock
    implements GetMovieDetailsUseCase {}

void main() {
  late MockGetMovieDetailsUseCase getMovieDetailsUseCase;
  late MovieDetailsBloc bloc;

  setUp(() {
    getMovieDetailsUseCase = MockGetMovieDetailsUseCase();
    bloc = MovieDetailsBloc(getMovieDetailsUseCase);
  });

  tearDown(() {
    bloc.close();
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
    status: StatusEnum.released,
    tagline: 'How much can you know about yourself?',
    title: 'Suicide Squad',
    video: false,
    voteAverage: 5.91,
    voteCount: 1466,
  );

  test('Should initiate state equals to MovieDetailsInitial', () async {
    expect(bloc.state, equals(const MovieDetailsInitial()));
  });

  blocTest<MovieDetailsBloc, MovieDetailsState>(
    'Should emit the correct state sequence when getMovieDetailsUseCase returns success',
    build: () {
      when(() => getMovieDetailsUseCase(tId))
          .thenAnswer((_) async => Right(tMovieDetailsEntity));
      return bloc;
    },
    act: (bloc) {
      bloc.add(const GetMovieDetailsEvent(id: tId));
    },
    expect: () => <dynamic>[
      isA<MovieDetailsLoading>(),
      isA<MovieDetailsSuccess>(),
    ],
  );

  blocTest<MovieDetailsBloc, MovieDetailsState>(
    'Should emit the correct state sequence when getMovieDetailsUseCase returns error',
    build: () {
      when(() => getMovieDetailsUseCase(tId))
          .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
      return bloc;
    },
    act: (bloc) {
      bloc.add(const GetMovieDetailsEvent(id: tId));
    },
    expect: () => <dynamic>[
      isA<MovieDetailsLoading>(),
      isA<MovieDetailsError>(),
    ],
  );
}
