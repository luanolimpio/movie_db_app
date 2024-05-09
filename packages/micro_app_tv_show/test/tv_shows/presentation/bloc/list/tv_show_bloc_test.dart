import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/core/enums/tv_show_type_enum.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_result_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/usecases/get_tv_shows_usecase.dart';
import 'package:micro_app_tv_show/src/tv_shows/presentation/bloc/list/tv_show_bloc.dart';
import 'package:micro_app_tv_show/src/tv_shows/presentation/bloc/list/tv_show_event.dart';
import 'package:micro_app_tv_show/src/tv_shows/presentation/bloc/list/tv_show_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetTVShowsUseCase extends Mock implements GetTVShowsUseCase {}

void main() {
  late MockGetTVShowsUseCase getTVShowsUseCase;
  late TVShowBloc bloc;

  setUp(() {
    getTVShowsUseCase = MockGetTVShowsUseCase();
    bloc = TVShowBloc(getTVShowsUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  final tTVShowEntity = TVShowEntity(
    page: 1,
    results: [
      TVShowResultEntity(
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
    ],
    totalPages: 14,
    totalResults: 265,
  );

  const tPage = 1;

  const tType = TVShowTypeEnum.onTheAir;

  test('Should initiate state equals to TVShowInitial', () async {
    expect(bloc.state, equals(const TVShowInitial()));
  });

  blocTest<TVShowBloc, TVShowState>(
    'Should emit the correct state sequence when getTVShowsUseCase returns success',
    build: () {
      when(() => getTVShowsUseCase(type: tType, page: tPage))
          .thenAnswer((_) async => Right(tTVShowEntity));
      return bloc;
    },
    act: (bloc) {
      bloc.add(const GetTVShowsEvent(type: tType));
    },
    expect: () => <dynamic>[
      isA<TVShowsLoading>(),
      isA<TVShowsSuccess>(),
    ],
  );

  blocTest<TVShowBloc, TVShowState>(
    'Should emit the correct state sequence when getTVShowsUseCase returns error',
    build: () {
      when(() => getTVShowsUseCase(type: tType, page: tPage))
          .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
      return bloc;
    },
    act: (bloc) {
      bloc.add(const GetTVShowsEvent(type: tType));
    },
    expect: () => <dynamic>[
      isA<TVShowsLoading>(),
      isA<TVShowsError>(),
    ],
  );
}
