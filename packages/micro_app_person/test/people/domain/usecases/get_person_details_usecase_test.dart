import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/department_type_enum.dart';
import 'package:micro_app_person/src/core/enums/gender_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/person_details_entity.dart';
import 'package:micro_app_person/src/people/domain/repositories/i_person_repository.dart';
import 'package:micro_app_person/src/people/domain/usecases/get_person_details_usecase.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockPersonRepository extends Mock implements IPersonRepository {}

void main() {
  late MockPersonRepository repository;
  late GetPersonDetailsUseCase getPersonDetailsUseCase;

  setUp(() {
    repository = MockPersonRepository();
    getPersonDetailsUseCase = GetPersonDetailsUseCase(repository);
  });

  const tId = 31;

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

  test('Should return a PersonDetailsEntity when call repository', () async {
    when(() => repository.getDetails(tId)).thenAnswer((_) async => Right(tPersonDetailsEntity));
    final result = await getPersonDetailsUseCase(tId);
    expect(result, Right<Exception, PersonDetailsEntity>(tPersonDetailsEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getDetails(tId)).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getPersonDetailsUseCase(tId);
    expect(result.isLeft(), true);
  });
}
