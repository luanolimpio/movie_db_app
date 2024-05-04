import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/media_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/known_for_entity.dart';
import 'package:micro_app_person/src/people/domain/entities/person_entity.dart';
import 'package:micro_app_person/src/people/domain/usecases/get_popular_people_usecase.dart';
import 'package:micro_app_person/src/people/presentation/bloc/person_bloc.dart';
import 'package:micro_app_person/src/people/presentation/bloc/person_event.dart';
import 'package:micro_app_person/src/people/presentation/bloc/person_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetPopularPeopleUseCase extends Mock
    implements GetPopularPeopleUseCase {}

void main() {
  late MockGetPopularPeopleUseCase getPopularPeopleUseCase;
  late PersonBloc bloc;

  setUp(() {
    getPopularPeopleUseCase = MockGetPopularPeopleUseCase();
    bloc = PersonBloc(getPopularPeopleUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  final tListPersonEntity = [
    const PersonEntity(
      adult: false,
      gender: 1,
      id: 224513,
      knownFor: [
        KnownForEntity(
          id: 335984,
          mediaType: MediaTypeEnum.movie,
          title: 'Blade Runner 2049',
          originalTitle: 'Blade Runner 2049',
          posterPath: '/ilRyazdMJwN05exqhwK4tMKBYZs.jpg',
        ),
      ],
      knownForDepartment: 'Acting',
      name: 'Rufus Sewell',
      originalName: 'Rufus Sewell',
      popularity: 102.157,
      profilePath: '/yc2EWyg45GO03YqDttaEhjvegiE.jpg',
    ),
  ];

  group('getPopularPeople', () {
    blocTest<PersonBloc, PersonState>(
      'Should emit the correct state sequence when getPopularPeopleUseCase returns success',
      build: () {
        when(() => getPopularPeopleUseCase())
            .thenAnswer((_) async => Right(tListPersonEntity));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetPopularPeopleEvent());
      },
      expect: () => <dynamic>[
        isA<PopularPeopleLoading>(),
        isA<PopularPeopleSuccess>(),
      ],
    );

    blocTest<PersonBloc, PersonState>(
      'Should emit the correct state sequence when getPopularPeopleUseCase returns error',
      build: () {
        when(() => getPopularPeopleUseCase())
            .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetPopularPeopleEvent());
      },
      expect: () => <dynamic>[
        isA<PopularPeopleLoading>(),
        isA<PopularPeopleError>(),
      ],
    );
  });
}
