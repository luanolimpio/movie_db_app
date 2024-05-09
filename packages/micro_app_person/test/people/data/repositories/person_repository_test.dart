import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/department_type_enum.dart';
import 'package:micro_app_person/src/core/enums/gender_type_enum.dart';
import 'package:micro_app_person/src/people/domain/entities/person_result_entity.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_app_person/src/people/data/datasources/i_person_datasource.dart';
import 'package:micro_app_person/src/people/data/repositories/person_repository.dart';
import 'package:micro_app_person/src/people/domain/entities/person_details_entity.dart';
import 'package:micro_app_person/src/people/domain/entities/person_entity.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockPersonDatasource extends Mock implements IPersonDatasource {}

void main() {
  late MockPersonDatasource datasource;
  late PersonRepository repository;

  setUp(() {
    datasource = MockPersonDatasource();
    repository = PersonRepository(datasource);
  });

  const tId = 31;

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

  const tPage = 1;

  group('getList', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getList(page: tPage))
          .thenAnswer((_) async => const Right(tPersonEntity));
      final result = await repository.getList(page: tPage);
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource.getList(page: tPage))
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository.getList(page: tPage);
      expect(result.isLeft(), true);
    });
  });

  group('getDetails', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getDetails(tId))
          .thenAnswer((_) async => Right(tPersonDetailsEntity));
      final result = await repository.getDetails(tId);
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource.getDetails(tId))
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository.getDetails(tId);
      expect(result.isLeft(), true);
    });
  });
}
