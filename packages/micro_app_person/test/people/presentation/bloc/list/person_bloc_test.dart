import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/department_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/person_entity.dart';
import 'package:micro_app_person/src/people/domain/entities/person_result_entity.dart';
import 'package:micro_app_person/src/people/domain/usecases/get_popular_people_usecase.dart';
import 'package:micro_app_person/src/people/presentation/bloc/list/person_bloc.dart';
import 'package:micro_app_person/src/people/presentation/bloc/list/person_event.dart';
import 'package:micro_app_person/src/people/presentation/bloc/list/person_state.dart';
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

  const tPersonEntity = PersonEntity(
    page: 1,
    results: [
      PersonResultEntity(
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
    ],
    totalPages: 33,
    totalResults: 649,
  );

  const tPage = 1;

  test('Should initiate state equals to PersonInitial', () async {
    expect(bloc.state, equals(const PersonInitial()));
  });

  blocTest<PersonBloc, PersonState>(
    'Should emit the correct state sequence when getPopularPeopleUseCase returns success',
    build: () {
      when(() => getPopularPeopleUseCase(page: tPage))
          .thenAnswer((_) async => const Right(tPersonEntity));
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
      when(() => getPopularPeopleUseCase(page: tPage))
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
}

