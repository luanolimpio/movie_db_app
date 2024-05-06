import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/department_type_enum.dart';
import '../../../core/enums/gender_type_enum.dart';

class PersonDetailsEntity extends Equatable {
  const PersonDetailsEntity({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.gender,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    this.birthday,
    this.deathDay,
    this.homepage,
    this.profilePath,
  });

  final bool adult;
  final List<String> alsoKnownAs;
  final String biography;
  final DateTime? birthday;
  final DateTime? deathDay;
  final GenderTypeEnum gender;
  final String? homepage;
  final int id;
  final String imdbId;
  final DepartmentTypeEnum knownForDepartment;
  final String name;
  final String placeOfBirth;
  final double popularity;
  final String? profilePath;

  @override
  String toString() {
    return 'PersonDetailsEntity(adult: $adult,'
        ' alsoKnownAs: $alsoKnownAs,'
        ' biography: $biography,'
        ' birthday: $birthday,'
        ' deathDay: $deathDay,'
        ' gender: $gender,'
        ' homepage: $homepage,'
        ' id: $id,'
        ' imdbId: $imdbId,'
        ' knownForDepartment: $knownForDepartment,'
        ' name: $name,'
        ' placeOfBirth: $placeOfBirth,'
        ' popularity: $popularity,'
        ' profilePath: $profilePath)';
  }

  @override
  List<Object?> get props => [
        adult,
        alsoKnownAs,
        biography,
        birthday,
        deathDay,
        gender,
        homepage,
        id,
        imdbId,
        knownForDepartment,
        name,
        placeOfBirth,
        popularity,
        profilePath,
      ];
}
