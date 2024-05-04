import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/media_type_enum.dart';
import 'package:micro_app_person/src/people/data/models/known_for_model.dart';
import 'package:micro_app_person/src/people/data/models/person_model.dart';
import 'package:micro_app_person/src/people/domain/entities/person_entity.dart';

void main() {
  const tPersonModel = PersonModel(
    adult: false,
    gender: 1,
    id: 224513,
    knownFor: [
      KnownForModel(
        id: 335984,
        mediaType: MediaTypeEnum.movie,
        originalTitle: 'Blade Runner 2049',
        title: 'Blade Runner 2049',
        posterPath: '/ilRyazdMJwN05exqhwK4tMKBYZs.jpg',
      ),
    ],
    knownForDepartment: 'Acting',
    name: 'Rufus Sewell',
    popularity: 102.157,
    profilePath: '/yc2EWyg45GO03YqDttaEhjvegiE.jpg',
  );

  const tJson =
      '{"adult": false,"gender": 1,"id": 224513,"known_for": [{"adult": false,"backdrop_path": "/ilRyazdMJwN05exqhwK4tMKBYZs.jpg","genre_ids": [878, 18],"id": 335984,"media_type": "movie","original_language": "en","original_title": "Blade Runner 2049","overview": "Thirty years after the events of the first film","poster_path": "/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg","release_date": "2017-10-04","title": "Blade Runner 2049","video": false,"vote_average": 7.5,"vote_count": 11771}],"known_for_department": "Acting","name": "Rufus Sewell","popularity": 102.157,"profile_path": "/yc2EWyg45GO03YqDttaEhjvegiE.jpg"}';

  test('Should be a subclass of PersonEntity', () {
    expect(tPersonModel, isA<PersonEntity>());
  });

  test('Should return a valid PersonModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = PersonModel.fromJson(jsonMap);
    expect(result, isA<PersonEntity>());
  });
}
