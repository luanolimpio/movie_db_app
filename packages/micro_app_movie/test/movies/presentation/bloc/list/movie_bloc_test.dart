import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/core/enums/movie_type_enum.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_entity.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_result_entity.dart';
import 'package:micro_app_movie/src/movies/domain/usecases/get_movies_usecase.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/list/movie_bloc.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/list/movie_event.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/list/movie_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetMoviesUseCase extends Mock implements GetMoviesUseCase {}

void main() {
  late MockGetMoviesUseCase getMoviesUseCase;
  late MovieBloc bloc;

  setUp(() {
    getMoviesUseCase = MockGetMoviesUseCase();
    bloc = MovieBloc(getMoviesUseCase);
  });

  tearDown(() {
    bloc.close();
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

  test('Should initiate state equals to MovieInitial', () async {
    expect(bloc.state, equals(const MovieInitial()));
  });

  group('getMovies', () {
    blocTest<MovieBloc, MovieState>(
      'Should emit the correct state sequence when getMoviesUseCase returns success',
      build: () {
        when(() => getMoviesUseCase(type: tType, page: tPage))
            .thenAnswer((_) async => Right(tMovieEntity));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetMoviesEvent(type: tType));
      },
      expect: () => <dynamic>[
        isA<MoviesLoading>(),
        isA<MoviesSuccess>(),
      ],
    );

    blocTest<MovieBloc, MovieState>(
      'Should emit the correct state sequence when getMoviesUseCase returns error',
      build: () {
        when(() => getMoviesUseCase(type: tType, page: tPage))
            .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetMoviesEvent(type: tType));
      },
      expect: () => <dynamic>[
        isA<MoviesLoading>(),
        isA<MoviesError>(),
      ],
    );
  });
}
