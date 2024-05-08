import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_search/src/search/data/models/multi_search_model.dart';
import 'package:micro_app_search/src/search/domain/entities/multi_search_entity.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_common/src/utils/enums/media_type_enum.dart';

void main() {
  const tMultiSearchModel = MultiSearchModel(
    adult: false,
    id: 11,
    name: 'Star Wars',
    originalName: 'Star Wars',
    overview:
    'Princess Leia is captured and held hostage by the evil Imperial forces',
    mediaType: MediaTypeEnum.movie,
    posterPath: '/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg',
  );

  const tJson =
      '{"adult": false,"backdrop_path": "/aDYSnJAK0BTVeE8osOy22Kz3SXY.jpg","id": 11,"title": "Star Wars","original_language": "en","original_title": "Star Wars","overview": "Princess Leia is captured and held hostage by the evil Imperial forces","poster_path": "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg","media_type": "movie","genre_ids": [12],"popularity": 78.047,"release_date": "1977-05-25","video": false,"vote_average": 8.208,"vote_count": 18528}';

  test('Should be a subclass of MultiSearchEntity', () {
    expect(tMultiSearchModel, isA<MultiSearchEntity>());
  });

  test('Should return a valid MultiSearchModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = MultiSearchModel.fromJson(jsonMap);
    expect(result, isA<MultiSearchEntity>());
  });
}
