import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:micro_app_person/src/core/enums/department_type_enum.dart';
import 'package:micro_app_person/src/core/enums/gender_type_enum.dart';
import 'package:micro_app_person/src/people/data/models/person_details_model.dart';
import 'package:micro_app_person/src/people/domain/entities/person_details_entity.dart';

void main() {
  final tPersonDetailsModel = PersonDetailsModel(
    adult: false,
    alsoKnownAs: const ['Thomas Jeffrey Hanks'],
    biography: 'Thomas Jeffrey Hanks (born July 9, 1956) is an American actor and filmmaker',
    birthday: DateTime.now(),
    deathDay: null,
    gender: GenderTypeEnum.male,
    homepage: null,
    id: 31,
    imdbId: 'nm0000158',
    knownForDepartment: DepartmentTypeEnum.acting,
    name: 'Tom Hanks',
    placeOfBirth: 'Concord, California, USA',
    popularity: 82.989,
    profilePath: '/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg',
  );

  const tJson =
      '{"adult": false, "also_known_as": ["Thomas Jeffrey Hanks"], "biography": "Thomas Jeffrey Hanks (born July 9, 1956) is an American actor and filmmaker", "birthday": "1956-07-09","deathday": null,"gender": 2,"homepage": null,"id": 31,"imdb_id": "nm0000158","known_for_department": "Acting","name": "Tom Hanks","place_of_birth": "Concord, California, USA","popularity": 82.989,"profile_path": "/xndWFsBlClOJFRdhSt4NBwiPq2o.jpg"}';

  test('Should be a subclass of PersonDetailsEntity', () {
    expect(tPersonDetailsModel, isA<PersonDetailsEntity>());
  });

  test('Should return a valid PersonDetailsModel when JSON is given', () async {
    final Map<String, dynamic> jsonMap = json.decode(tJson);
    final result = PersonDetailsModel.fromJson(jsonMap);
    expect(result, isA<PersonDetailsEntity>());
  });
}
