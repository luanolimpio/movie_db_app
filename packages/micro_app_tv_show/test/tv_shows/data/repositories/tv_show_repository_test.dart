import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/datasources/i_tv_show_datasource.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/repositories/tv_show_repository.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/tv_show_entity.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class MockTVShowDatasource extends Mock implements ITVShowDatasource {}

void main() {
  late MockTVShowDatasource datasource;
  late TVShowRepository repository;

  setUp(() {
    datasource = MockTVShowDatasource();
    repository = TVShowRepository(datasource);
  });

  final tListTVShowEntity = [
    TVShowEntity(
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
    ),
  ];

  group('getOnTheAir', () {
    test('Should return success when call datasource', () async {
      when(() => datasource.getOnTheAir())
          .thenAnswer((_) async => Right(tListTVShowEntity));
      final result = await repository.getOnTheAir();
      expect(result.isRight(), true);
    });

    test('Should return error when call datasource', () async {
      when(() => datasource.getOnTheAir())
          .thenAnswer((_) async => Left(Exception('Ocorreu algum erro')));
      final result = await repository.getOnTheAir();
      expect(result.isLeft(), true);
    });
  });
}
