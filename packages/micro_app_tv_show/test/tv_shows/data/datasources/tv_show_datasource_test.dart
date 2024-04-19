import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/datasources/tv_show_datasource.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late MockDioClient dioClient;
  late TVShowDatasource dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = TVShowDatasource(dioClient);
  });

  const tJsonOnTheAir =
      '{"page": 1, "results": [{"backdrop_path": "/mAJ84W6I8I272Da87qplS2Dp9ST.jpg","first_air_date": "2023-01-23","genre_ids": [9648, 18],"id": 202250,"name": "Dirty Linen","origin_country": ["PH"],"original_language": "tl","original_name": "Dirty Linen","overview": "To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.","popularity": 2797.914,"poster_path": "/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg","vote_average": 5,"vote_count": 13}]}';

  group('getOnTheAir', () {
    test('Should return success when call dio client', () async {
      when(() => dioClient.get(any())).thenAnswer(
        (_) async => Response(
          data: json.decode(tJsonOnTheAir),
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '',
          ),
        ),
      );
      final result = await dataSource.getOnTheAir();
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
      final result = await dataSource.getOnTheAir();
      expect(result.isLeft(), true);
    });
  });
}
