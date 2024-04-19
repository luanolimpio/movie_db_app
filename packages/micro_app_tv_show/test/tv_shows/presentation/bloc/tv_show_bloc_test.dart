import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_entity.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/usecases/get_on_the_air_usecase.dart';
import 'package:micro_app_tv_show/src/tv_shows/presentation/bloc/tv_show_bloc.dart';
import 'package:micro_app_tv_show/src/tv_shows/presentation/bloc/tv_show_event.dart';
import 'package:micro_app_tv_show/src/tv_shows/presentation/bloc/tv_show_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetOnTheAirUseCase extends Mock implements GetOnTheAirUseCase {}
void main() {
  late MockGetOnTheAirUseCase getOnTheAirUseCase;
  late TVShowBloc bloc;

  setUp(() {
    getOnTheAirUseCase = MockGetOnTheAirUseCase();
    bloc = TVShowBloc(getOnTheAirUseCase);
  });

  tearDown(() {
    bloc.close();
  });

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

  group('getOnTheAir', () {
    blocTest<TVShowBloc, TVShowState>(
      'Should emit the correct state sequence when getOnTheAirUseCase returns success',
      build: () {
        when(() => getOnTheAirUseCase())
            .thenAnswer((_) async => Right(tListTVShowEntity));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetOnTheAirEvent());
      },
      expect: () => <dynamic>[
        isA<TVShowLoading>(),
        isA<TVShowSuccess>(),
      ],
    );

    blocTest<TVShowBloc, TVShowState>(
      'Should emit the correct state sequence when getOnTheAirUseCase returns error',
      build: () {
        when(() => getOnTheAirUseCase())
            .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetOnTheAirEvent());
      },
      expect: () => <dynamic>[
        isA<TVShowLoading>(),
        isA<TVShowError>(),
      ],
    );
  });
}

