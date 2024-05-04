import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/people/data/datasources/person_datasource.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late MockDioClient dioClient;
  late PersonDatasource dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = PersonDatasource(dioClient);
  });

  const tJsonList =
      '{"page": 1, "results": [{"adult": false,"gender": 1,"id": 224513,"known_for": [{"adult": false,"backdrop_path": "/ilRyazdMJwN05exqhwK4tMKBYZs.jpg","genre_ids": [878, 18],"id": 335984,"media_type": "movie","original_language": "en","original_title": "Blade Runner 2049","overview": "Thirty years after the events of the first film","poster_path": "/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg","release_date": "2017-10-04","title": "Blade Runner 2049","video": false,"vote_average": 7.5,"vote_count": 11771}],"known_for_department": "Acting","name": "Rufus Sewell","popularity": 102.157,"profile_path": "/yc2EWyg45GO03YqDttaEhjvegiE.jpg"}], "total_pages": 500, "total_results": 10000}';

  group('getList', () {
    test('Should return success when call dio client', () async {
      when(() => dioClient.get(any())).thenAnswer(
            (_) async => Response(
          data: json.decode(tJsonList),
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '',
          ),
        ),
      );
      final result = await dataSource.getList();
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
      final result = await dataSource.getList();
      expect(result.isLeft(), true);
    });
  });
}
