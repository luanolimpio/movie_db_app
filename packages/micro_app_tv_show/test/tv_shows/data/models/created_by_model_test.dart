import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/created_by_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/created_by_entity.dart';

void main() {
  const tCreatedByModel = CreatedByModel(
    id: 9813,
    creditId: '5256c8c219c2956ff604858a',
    name: 'David Benioff',
    gender: 2,
    profilePath: '/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg',
  );

  const tJson = '{"id": 9813,"credit_id": "5256c8c219c2956ff604858a","name": "David Benioff","gender": 2,"profile_path": "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg"}';

  test('Should be a subclass of CreatedByEntity', () {
    expect(tCreatedByModel, isA<CreatedByEntity>());
  });

  test('Should return a valid CreatedByModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = CreatedByModel.fromJson(jsonMap);
    expect(result, isA<CreatedByEntity>());
  });
}
