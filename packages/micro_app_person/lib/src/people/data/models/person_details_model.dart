import 'package:micro_common/micro_common.dart';

import '../../../core/enums/department_type_enum.dart';
import '../../../core/enums/gender_type_enum.dart';
import '../../domain/entities/person_details_entity.dart';

class PersonDetailsModel extends PersonDetailsEntity {
  const PersonDetailsModel({
    required super.adult,
    required super.alsoKnownAs,
    required super.biography,
    required super.birthday,
    required super.deathDay,
    required super.gender,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.knownForDepartment,
    required super.name,
    required super.placeOfBirth,
    required super.popularity,
    required super.profilePath,
  });

  factory PersonDetailsModel.fromJson(Map<String, dynamic> map) {
    return PersonDetailsModel(
      adult: map['adult'],
      alsoKnownAs: map['also_known_as'].cast<String>(),
      biography: map['biography'],
      birthday: (map['birthday'] as String).toDateTime!,
      deathDay: (map['deathday'] as String?)?.toDateTime,
      gender: getGenderTypeEnum(map['gender']),
      homepage: map['homepage'],
      id: map['id'],
      imdbId: map['imdb_id'],
      knownForDepartment: getDepartmentTypeEnum(map['known_for_department']),
      name: map['name'],
      placeOfBirth: map['place_of_birth'],
      popularity: map['popularity'],
      profilePath: map['profile_path'],
    );
  }
}
