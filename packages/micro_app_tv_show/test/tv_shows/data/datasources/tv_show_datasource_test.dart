import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/core/enums/tv_show_type_enum.dart';
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

  const tId = 1399;

  const tJsonList =
      '{"page": 1, "results": [{"backdrop_path": "/mAJ84W6I8I272Da87qplS2Dp9ST.jpg","first_air_date": "2023-01-23","genre_ids": [9648, 18],"id": 202250,"name": "Dirty Linen","origin_country": ["PH"],"original_language": "tl","original_name": "Dirty Linen","overview": "To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.","popularity": 2797.914,"poster_path": "/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg","vote_average": 5,"vote_count": 13}]}';

  const tJsonDetails = '{"adult": false,"backdrop_path": "/6LWy0jvMpmjoS9fojNgHIKoWL05.jpg","created_by": [{"id": 9813,"credit_id": "5256c8c219c2956ff604858a","name": "David Benioff","gender": 2,"profile_path": "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg"}],"episode_run_time": [60],"first_air_date": "2011-04-17","genres": [{"id": 18,"name": "Drama"}],"homepage": "http://www.hbo.com/game-of-thrones","id": 1399,"in_production": false,"languages": ["en"],"last_air_date": "2019-05-19","last_episode_to_air": {"id": 1551830,"name": "The Iron Throne","overview": "In the aftermath of the devastating attack on King\'s Landing, Daenerys must face the survivors.","vote_average": 4.809,"vote_count": 241 ,"air_date": "2019-05-19" ,"episode_number": 6 ,"production_code": "806" ,"runtime": 80 ,"season_number": 8 ,"show_id": 1399 ,"still_path": "/zBi2O5EJfgTS6Ae0HdAYLm9o2nf.jpg"},"name": "Game of Thrones","networks": [{"id": 49,"logo_path": "/tuomPhY2UtuPTqqFnKMVHvSb724.png","name": "HBO","origin_country": "US"}],"number_of_episodes": 73,"number_of_seasons": 8,"origin_country": ["US"],"original_language": "en","original_name": "Game of Thrones","overview": "Seven noble families fight for control","popularity": 346.098,"seasons": [{"air_date": "2011-04-17","episode_count": 10,"id": 3624,"name": "Season 1","overview": "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros","poster_path": "/wgfKiqzuMrFIkU1M68DDDY8kGC1.jpg","season_number": 1,"vote_average": 8.3}],"status": "Ended","tagline": "Winter Is Coming","type": "Scripted","vote_average": 8.438,"vote_count": 21390}';

  const tType = TVShowTypeEnum.onTheAir;

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
      final result = await dataSource.getList(tType);
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
      final result = await dataSource.getList(tType);
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
