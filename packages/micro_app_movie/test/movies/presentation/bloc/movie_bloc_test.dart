import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_details_entity.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_entity.dart';
import 'package:micro_app_movie/src/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:micro_app_movie/src/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/movie_bloc.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/movie_event.dart';
import 'package:micro_app_movie/src/movies/presentation/bloc/movie_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetNowPlayingUseCase extends Mock implements GetNowPlayingUseCase {}

class MockGetMovieDetailsUseCase extends Mock
    implements GetMovieDetailsUseCase {}

void main() {
  late MockGetNowPlayingUseCase getNowPlayingUseCase;
  late MockGetMovieDetailsUseCase getMovieDetailsUseCase;
  late MovieBloc bloc;

  setUp(() {
    getNowPlayingUseCase = MockGetNowPlayingUseCase();
    getMovieDetailsUseCase = MockGetMovieDetailsUseCase();
    bloc = MovieBloc(getNowPlayingUseCase, getMovieDetailsUseCase);
  });

  tearDown(() {
    bloc.close();
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
    status: 'Released',
    tagline: 'How much can you know about yourself?',
    title: 'Suicide Squad',
    video: false,
    voteAverage: 5.91,
    voteCount: 1466,
  );

  group('getNowPlaying', () {
    blocTest<MovieBloc, MovieState>(
      'Should emit the correct state sequence when getNowPlayingUseCase returns success',
      build: () {
        when(() => getNowPlayingUseCase())
            .thenAnswer((_) async => Right(tListMovieEntity));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetNowPlayingEvent());
      },
      expect: () => <dynamic>[
        isA<MovieLoading>(),
        isA<MovieSuccess>(),
      ],
    );

    blocTest<MovieBloc, MovieState>(
      'Should emit the correct state sequence when getNowPlayingUseCase returns error',
      build: () {
        when(() => getNowPlayingUseCase())
            .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetNowPlayingEvent());
      },
      expect: () => <dynamic>[
        isA<MovieLoading>(),
        isA<MovieError>(),
      ],
    );
  });

  group('getDetails', () {
    blocTest<MovieBloc, MovieState>(
      'Should emit the correct state sequence when getMovieDetailsUseCase returns success',
      build: () {
        when(() => getMovieDetailsUseCase(tId))
            .thenAnswer((_) async => Right(tMovieDetailsEntity));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetDetailsEvent(id: tId));
      },
      expect: () => <dynamic>[
        isA<MovieDetailsLoading>(),
        isA<MovieDetailsSuccess>(),
      ],
    );

    blocTest<MovieBloc, MovieState>(
      'Should emit the correct state sequence when getMovieDetailsUseCase returns error',
      build: () {
        when(() => getMovieDetailsUseCase(tId))
            .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetDetailsEvent(id: tId));
      },
      expect: () => <dynamic>[
        isA<MovieDetailsLoading>(),
        isA<MovieDetailsError>(),
      ],
    );
  });
}
