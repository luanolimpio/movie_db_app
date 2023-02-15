import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_movie/src/movies/data/models/genre_model.dart';
import 'package:micro_app_movie/src/movies/data/models/movie_details_model.dart';
import 'package:micro_app_movie/src/movies/domain/entities/movie_details_entity.dart';

void main() {
  final tMovieDetailsModel = MovieDetailsModel(
    adult: false,
    backdropPath: '/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg',
    budget: 63000000,
    genres: const [
      GenreModel(id: 18, name: 'Action'),
    ],
    id: 297761,
    imdbId: 'tt0137523',
    originalLanguage: 'en',
    originalTitle: 'Suicide Squad',
    overview:
        'From DC Comics comes the Suicide Squad, an antihero team of incarcerated',
    popularity: 48.261451,
    posterPath: '/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg',
    releaseDate: DateTime.now(),
    revenue: 100853753,
    runtime: 139,
    status: 'Released',
    tagline: 'How much can you know about yourself?',
    title: 'Suicide Squad',
    video: false,
    voteAverage: 5.91,
    voteCount: 1466,
  );

  const tJson =
      '{"adult": false, "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jp", "budget": 63000000, "genres": [{"id": 18, "name": "Action"}], "id": 297761, "imdb_id": "tt0137523", "original_language": "en", "original_title": "Suicide Squad", "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated", "popularity": 48.261451, "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg", "release_date": "2016-08-03", "revenue": 100853753, "runtime": 139, "status": "Released", "tagline": "How much can you know about yourself?", "title": "Suicide Squad", "video": false, "vote_average": 5.91, "vote_count": 1466}';

  test('Should be a subclass of MovieDetailsEntity', () {
    expect(tMovieDetailsModel, isA<MovieDetailsEntity>());
  });

  test('Should return a valid MovieDetailsModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = MovieDetailsModel.fromJson(jsonMap);
    expect(result, isA<MovieDetailsEntity>());
  });
}
