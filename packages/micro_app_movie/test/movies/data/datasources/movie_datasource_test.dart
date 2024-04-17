import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/movies/data/datasources/movie_datasource.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late MockDioClient dioClient;
  late MovieDatasource dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = MovieDatasource(dioClient);
  });

  const tId = 297761;

  const tJsonNowPlaying =
      '{"page": 1, "results": [{"poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg", "adult": false, "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated", "release_date": "2016-08-03", "genre_ids": [14, 28, 80], "id": 297761, "original_title": "Suicide Squad", "original_language": "en", "title": "Suicide Squad", "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg", "popularity": 48.261451, "vote_count": 1466, "video": false, "vote_average": 5.91}], "dates": {"maximum": "2016-09-01", "minimum": "2016-07-21"}, "total_pages": 33, "total_results": 649}';

  const tJsonDetails =
      '{"adult": false, "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jp", "budget": 63000000, "genres": [{"id": 18, "name": "Action"}], "id": 297761, "imdb_id": "tt0137523", "original_language": "en", "original_title": "Suicide Squad", "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated", "popularity": 48.261451, "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg", "release_date": "2016-08-03", "revenue": 100853753, "runtime": 139, "status": "Released", "tagline": "How much can you know about yourself?", "title": "Suicide Squad", "video": false, "vote_average": 5.91, "vote_count": 1466}';

  group('getNowPlaying', () {
    test('Should return success when call dio client', () async {
      when(() => dioClient.get(any())).thenAnswer(
        (_) async => Response(
          data: json.decode(tJsonNowPlaying),
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '',
          ),
        ),
      );
      final result = await dataSource.getNowPlaying();
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
      final result = await dataSource.getNowPlaying();
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
