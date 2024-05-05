import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/department_type_enum.dart';
import 'known_for_entity.dart';

class PersonEntity extends Equatable {
  const PersonEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  final bool adult;
  final int gender;
  final int id;
  final List<KnownForEntity> knownFor;
  final DepartmentTypeEnum knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;

  @override
  String toString() {
    return 'PersonEntity(adult: $adult,'
        ' gender: $gender,'
        ' id: $id,'
        ' knownFor: $knownFor,'
        ' knownForDepartment: $knownForDepartment,'
        ' name: $name,'
        ' originalName: $originalName,'
        ' popularity: $popularity,'
        ' profilePath: $profilePath)';
  }

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownFor,
        knownForDepartment,
        name,
        popularity,
        profilePath,
      ];
}
