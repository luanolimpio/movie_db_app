import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/department_type_enum.dart';
import 'package:micro_app_person/src/core/enums/gender_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/person_details_entity.dart';
import 'package:micro_app_person/src/people/domain/entities/person_entity.dart';
import 'package:micro_app_person/src/people/domain/usecases/get_person_details_usecase.dart';
import 'package:micro_app_person/src/people/domain/usecases/get_popular_people_usecase.dart';
import 'package:micro_app_person/src/people/presentation/bloc/person_bloc.dart';
import 'package:micro_app_person/src/people/presentation/bloc/person_event.dart';
import 'package:micro_app_person/src/people/presentation/bloc/person_state.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockGetPopularPeopleUseCase extends Mock
    implements GetPopularPeopleUseCase {}

class MockGetPersonDetailsUseCase extends Mock
    implements GetPersonDetailsUseCase {}

void main() {
  late MockGetPopularPeopleUseCase getPopularPeopleUseCase;
  late MockGetPersonDetailsUseCase getPersonDetailsUseCase;
  late PersonBloc bloc;

  setUp(() {
    getPopularPeopleUseCase = MockGetPopularPeopleUseCase();
    getPersonDetailsUseCase = MockGetPersonDetailsUseCase();
    bloc = PersonBloc(getPopularPeopleUseCase, getPersonDetailsUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  const tId = 31;

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
      knownForDepartment: DepartmentTypeEnum.acting,
      name: 'Rufus Sewell',
      originalName: 'Rufus Sewell',
      popularity: 102.157,
      profilePath: '/yc2EWyg45GO03YqDttaEhjvegiE.jpg',
    ),
  ];

  final tPersonDetailsEntity = PersonDetailsEntity(
    adult: false,
    alsoKnownAs: const ['Thomas Jeffrey Hanks'],
    biography: 'Thomas Jeffrey Hanks (born July 9, 1956) is an American actor and filmmaker',
    birthday: DateTime.now(),
    deathDay: null,
    gender: GenderTypeEnum.male,
    homepage: null,
    id: 31,
    imdbId: 'nm0000158',
    knownForDepartment: DepartmentTypeEnum.acting,
    name: 'Tom Hanks',
    placeOfBirth: 'Concord, California, USA',
    popularity: 82.989,
    profilePath: '/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg',
  );

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

  group('getDetails', () {
    blocTest<PersonBloc, PersonState>(
      'Should emit the correct state sequence when getPersonDetailsUseCase returns success',
      build: () {
        when(() => getPersonDetailsUseCase(tId))
            .thenAnswer((_) async => Right(tPersonDetailsEntity));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetPersonDetailsEvent(id: tId));
      },
      expect: () => <dynamic>[
        isA<PersonDetailsLoading>(),
        isA<PersonDetailsSuccess>(),
      ],
    );

    blocTest<PersonBloc, PersonState>(
      'Should emit the correct state sequence when getPersonDetailsUseCase returns error',
      build: () {
        when(() => getPersonDetailsUseCase(tId))
            .thenAnswer((_) async => Left(ApiException('Ocorreu algum erro')));
        return bloc;
      },
      act: (bloc) {
        bloc.add(const GetPersonDetailsEvent(id: tId));
      },
      expect: () => <dynamic>[
        isA<PersonDetailsLoading>(),
        isA<PersonDetailsError>(),
      ],
    );
  });
}
