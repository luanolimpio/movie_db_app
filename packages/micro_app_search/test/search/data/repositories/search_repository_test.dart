import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_search/src/search/data/datasources/i_search_datasource.dart';
import 'package:micro_app_search/src/search/data/repositories/search_repository.dart';
import 'package:micro_app_search/src/search/domain/entities/multi_search_entity.dart';
import 'package:micro_common/src/utils/enums/media_type_enum.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockSearchDatasource extends Mock implements ISearchDatasource {}

void main() {
  late MockSearchDatasource datasource;
  late SearchRepository repository;

  setUp(() {
    datasource = MockSearchDatasource();
    repository = SearchRepository(datasource);
  });

  const tQuery = 'Star Wars';

  const tListMultiSearchEntity = [
    MultiSearchEntity(
      adult: false,
      id: 11,
      name: 'Star Wars',
      originalName: 'Star Wars',
      overview:
      'Princess Leia is captured and held hostage by the evil Imperial forces',
      mediaType: MediaTypeEnum.movie,
      posterPath: '/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
    )
  ];

  group('search', () {
    test('Should return success when call datasource', () async {
      when(() => datasource(tQuery))
          .thenAnswer((_) async => const Right(tListMultiSearchEntity));
      final result = await repository(tQuery);
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource(tQuery))
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository(tQuery);
      expect(result.isLeft(), true);
    });
  });
}
