import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/media_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/known_for_entity.dart';
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

  final tListPersonEntity = [
    const PersonEntity(
      adult: false,
      gender: 1,
      id: 224513,
      knownFor: [
        KnownForEntity(
          id: 335984,
          mediaType: MediaTypeEnum.movie,
          originalTitle: 'Blade Runner 2049',
          title: 'Blade Runner 2049',
          posterPath: '/ilRyazdMJwN05exqhwK4tMKBYZs.jpg',
        ),
      ],
      knownForDepartment: 'Acting',
      name: 'Rufus Sewell',
      popularity: 102.157,
      profilePath: '/yc2EWyg45GO03YqDttaEhjvegiE.jpg',
    ),
  ];

  test('Should return a PersonEntity when call repository', () async {
    when(() => repository.getList()).thenAnswer((_) async => Right(tListPersonEntity));
    final result = await getPopularPeopleUseCase();
    expect(result, Right<Exception, List<PersonEntity>>(tListPersonEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository.getList()).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await getPopularPeopleUseCase();
    expect(result.isLeft(), true);
  });
}
