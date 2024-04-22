import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_tv_show/src/tv_shows/data/models/network_model.dart';
import 'package:micro_app_tv_show/src/tv_shows/domain/entities/network_entity.dart';

void main() {
  const tNetworkModel = NetworkModel(
    id: 49,
    logoPath: '/tuomPhY2UtuPTqqFnKMVHvSb724.png',
    name: 'HBO',
    originCountry: 'US',
  );

  const tJson = '{"id": 49,"logo_path": "/tuomPhY2UtuPTqqFnKMVHvSb724.png","name": "HBO","origin_country": "US"}';

  test('Should be a subclass of NetworkEntity', () {
    expect(tNetworkModel, isA<NetworkEntity>());
  });

  test('Should return a valid NetworkModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = NetworkModel.fromJson(jsonMap);
    expect(result, isA<NetworkEntity>());
  });
}
