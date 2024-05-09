import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/tv_show_result_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_result_entity.dart';

void main() {
  final tTVShowResultModel = TVShowResultModel(
    backdropPath: '/mAJ84W6I8I272Da87qplS2Dp9ST.jpg',
    firstAirDate: DateTime.now(),
    genreIds: const [9648, 18],
    id: 202250,
    name: 'Dirty Linen',
    originCountry: const ['PH'],
    originalLanguage: 'tl',
    originalName: 'Dirty Linen',
    overview:
    'To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.',
    popularity: 2797.914,
    posterPath: '/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg',
    voteAverage: 5,
    voteCount: 13,
  );

  const tJson =
      '{"backdrop_path": "/mAJ84W6I8I272Da87qplS2Dp9ST.jpg","first_air_date": "2023-01-23","genre_ids": [9648, 18],"id": 202250,"name": "Dirty Linen","origin_country": ["PH"],"original_language": "tl","original_name": "Dirty Linen","overview": "To exact vengeance, a young woman infiltrates the household of an influential family as a housemaid to expose their dirty secrets. However, love will get in the way of her revenge plot.","popularity": 2797.914,"poster_path": "/aoAZgnmMzY9vVy9VWnO3U5PZENh.jpg","vote_average": 5,"vote_count": 13}';

  test('Should be a subclass of TVShowResultEntity', () {
    expect(tTVShowResultModel, isA<TVShowResultEntity>());
  });

  test('Should return a valid TVShowResultModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = TVShowResultModel.fromJson(jsonMap);
    expect(result, isA<TVShowResultEntity>());
  });
}
