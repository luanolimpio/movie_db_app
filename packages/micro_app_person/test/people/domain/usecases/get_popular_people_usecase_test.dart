import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/department_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/person_result_entity.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_app_person/src/people/domain/entities/person_entity.dart';
import 'package:micro_app_person/src/people/domain/repositories/i_person_repository.dart';
import 'package:micro_app_person/src/people/domain/usecases/get_popular_people_usecase.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockPersonRepository extends Mock implements IPersonRepository {}

void main() {
  late MockPersonRepository repository;
  late GetPopularPeopleUseCase getPopularPeopleUseCase;

  setUp(() {
    repository = MockPersonRepository();
    getPopularPeopleUseCase = GetPopularPeopleUseCase(repository);
  });

  const tPersonEntity = PersonEntity(
    page: 1,
    results: [
      PersonResultEntity(
        adult: false,
        gender: 1,
        id: 224513,
        knownFor: [
          KnownForModel(
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

  test('Should return a PersonEntity when call repository', () async {
    when(() => repository.getList(page: tPage)).thenAnswer((_) async => const Right(tPersonEntity));
    final result = await getPopularPeopleUseCase(page: tPage);
    expect(result, const Right<Exception, PersonEntity>(tPersonEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getList(page: tPage)).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getPopularPeopleUseCase(page: tPage);
    expect(result.isLeft(), true);
  });
}
