import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/movies/data/models/movie_result_model.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_result_entity.dart';

void main() {
  final tMovieResultModel = MovieResultModel(
    posterPath: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
    adult: false,
    overview:
        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated',
    releaseDate: DateTime.now(),
    genreIds: const [14, 28, 80],
    id: 297761,
    originalTitle: 'Suicide Squad',
    originalLanguage: 'en',
    title: 'Suicide Squad',
    backdropPath: '/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg',
    popularity: 48.261451,
    voteCount: 1466,
    video: false,
    voteAverage: 5.91,
  );

  const tJson =
      '{"poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg", "adult": false, "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated", "release_date": "2016-08-03", "genre_ids": [14, 28, 80], "id": 297761, "original_title": "Suicide Squad", "original_language": "en", "title": "Suicide Squad", "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg", "popularity": 48.261451, "vote_count": 1466, "video": false, "vote_average": 5.91}';

  test('Should be a subclass of MovieResultEntity', () {
    expect(tMovieResultModel, isA<MovieResultEntity>());
  });

  test('Should return a valid MovieResultModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = MovieResultModel.fromJson(jsonMap);
    expect(result, isA<MovieResultEntity>());
  });
}
