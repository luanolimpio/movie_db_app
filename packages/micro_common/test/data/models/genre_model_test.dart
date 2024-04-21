import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_common/src/data/models/genre_model.dart';
import 'package:micro_common/src/domain/entities/genre_entity.dart';

void main() {
  const tGenreModel = GenreModel(
    id: 18,
    name: 'Drama',
  );

  const tJson = '{"id": 18,"name": "Drama"}';

  test('Should be a subclass of GenreEntity', () {
    expect(tGenreModel, isA<GenreEntity>());
  });

  test('Should return a valid GenreModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = GenreModel.fromJson(jsonMap);
    expect(result, isA<GenreEntity>());
  });
}
