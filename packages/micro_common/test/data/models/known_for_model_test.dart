import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_common/src/utils/enums/media_type_enum.dart';
import 'package:micro_common/src/data/models/known_for_model.dart';
import 'package:micro_common/src/domain/entities/known_for_entity.dart';

void main() {
  const tKnownForModel = KnownForModel(
    id: 335984,
    mediaType: MediaTypeEnum.movie,
    title: 'Blade Runner 2049',
    originalTitle: 'Blade Runner 2049',
    posterPath: '/ilRyazdMJwN05exqhwK4tMKBYZs.jpg',
  );

  const tJson = '{"adult": false,"backdrop_path": "/ilRyazdMJwN05exqhwK4tMKBYZs.jpg","genre_ids": [878, 18],"id": 335984,"media_type": "movie","original_language": "en","original_title": "Blade Runner 2049","overview": "Thirty years after the events of the first film","poster_path": "/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg","release_date": "2017-10-04","title": "Blade Runner 2049","video": false,"vote_average": 7.5,"vote_count": 11771}';

  test('Should be a subclass of KnownForEntity', () {
    expect(tKnownForModel, isA<KnownForEntity>());
  });

  test('Should return a valid KnownForModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = KnownForModel.fromJson(jsonMap);
    expect(result, isA<KnownForEntity>());
  });
}
