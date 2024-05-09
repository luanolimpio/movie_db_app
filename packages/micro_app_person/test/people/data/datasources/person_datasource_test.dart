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

  const tId = 31;

  const tJsonList =
      '{"page": 1, "results": [{"adult": false,"gender": 1,"id": 224513,"known_for": [{"adult": false,"backdrop_path": "/ilRyazdMJwN05exqhwK4tMKBYZs.jpg","genre_ids": [878, 18],"id": 335984,"media_type": "movie","original_language": "en","original_title": "Blade Runner 2049","overview": "Thirty years after the events of the first film","poster_path": "/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg","release_date": "2017-10-04","title": "Blade Runner 2049","video": false,"vote_average": 7.5,"vote_count": 11771}],"known_for_department": "Acting","name": "Rufus Sewell","original_name": "Rufus Sewell","popularity": 102.157,"profile_path": "/yc2EWyg45GO03YqDttaEhjvegiE.jpg"}], "total_pages": 500, "total_results": 10000}';

  const tJsonDetails =
      '{"adult": false, "also_known_as": ["Thomas Jeffrey Hanks"], "biography": "Thomas Jeffrey Hanks (born July 9, 1956) is an American actor and filmmaker", "birthday": "1956-07-09","deathday": null,"gender": 2,"homepage": null,"id": 31,"imdb_id": "nm0000158","known_for_department": "Acting","name": "Tom Hanks","place_of_birth": "Concord, California, USA","popularity": 82.989,"profile_path": "/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg"}';

  const tPage = 1;

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
      final result = await dataSource.getList(page: tPage);
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
      final result = await dataSource.getList(page: tPage);
      expect(result.isLeft(), true);
    });
  });

  group('getDetails', () {
    test('Should return success when call dio client', () async {
      when(() => dioClient.get(any())).thenAnswer(
            (_) async => Response(
          data: json.decode(tJsonDetails),
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '',
          ),
        ),
      );
      final result = await dataSource.getDetails(tId);
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
      final result = await dataSource.getDetails(tId);
      expect(result.isLeft(), true);
    });
  });
}
