import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/media_type_enum.dart';
import 'package:micro_app_person/src/people/data/datasources/i_person_datasource.dart';
import 'package:micro_app_person/src/people/data/repositories/person_repository.dart';
import 'package:micro_app_person/src/people/domain/entities/known_for_entity.dart';
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

  group('getList', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getList())
          .thenAnswer((_) async => Right(tListPersonEntity));
      final result = await repository.getList();
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource.getList())
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository.getList();
      expect(result.isLeft(), true);
    });
  });
}
