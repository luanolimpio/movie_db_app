import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_search/src/search/domain/entities/multi_search_entity.dart';
import 'package:micro_app_search/src/search/domain/repositories/i_search_repository.dart';
import 'package:micro_app_search/src/search/domain/usecases/search_by_name_usecase.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockSearchRepository extends Mock implements ISearchRepository {}

void main() {
  late MockSearchRepository repository;
  late SearchByNameUseCase searchByNameUseCase;

  setUp(() {
    repository = MockSearchRepository();
    searchByNameUseCase = SearchByNameUseCase(repository);
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

  test('Should return a MultiSearchEntity when call repository', () async {
    when(() => repository(tQuery)).thenAnswer((_) async => const Right(tListMultiSearchEntity));
    final result = await searchByNameUseCase(tQuery);
    expect(result, const Right<Exception, List<MultiSearchEntity>>(tListMultiSearchEntity));
  });

  test('Should return an exception when call repository', () async {
    when(() => repository(tQuery)).thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
    final result = await searchByNameUseCase(tQuery);
    expect(result.isLeft(), true);
  });
}
