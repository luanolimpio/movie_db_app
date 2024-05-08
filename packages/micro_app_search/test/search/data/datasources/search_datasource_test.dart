import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_search/src/search/data/datasources/search_datasource.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late MockDioClient dioClient;
  late SearchDatasource dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = SearchDatasource(dioClient);
  });

  const tQuery = 'Star Wars';

  const tJson =
      '{"page": 1, "results": [{"adult": false,"backdrop_path": "/aDYSnJAK0BTVeE8osOy22Kz3SXY.jpg","id": 11,"title": "Star Wars","original_language": "en","original_title": "Star Wars","overview": "Princess Leia is captured and held hostage by the evil Imperial forces","poster_path": "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg","media_type": "movie","genre_ids": [12],"popularity": 78.047,"release_date": "1977-05-25","video": false,"vote_average": 8.208,"vote_count": 18528}],"total_pages": 11,"total_results": 201}';

  group('search', () {
    test('Should return success when call dio client', () async {
      when(() => dioClient.get(any())).thenAnswer(
            (_) async => Response(
          data: json.decode(tJson),
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '',
          ),
        ),
      );
      final result = await dataSource(tQuery);
      expect(result.isRight(), true);
    });

    test('Should return error when call dio client', () async {
      when(() => dioClient.get(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(
            path: '',
          ),
        ),
      );
      final result = await dataSource(tQuery);
      expect(result.isLeft(), true);
    });
  });
}
