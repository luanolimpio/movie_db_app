import '../../../core/enums/department_type_enum.dart';
import '../../domain/entities/person_entity.dart';
import 'known_for_model.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownFor,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.profilePath,
  });

  factory PersonModel.fromJson(Map<String, dynamic> map) {
    return PersonModel(
      adult: map['adult'],
      gender: map['gender'],
      id: map['id'],
      knownFor: List.from(map['known_for'])
          .map((e) => KnownForModel.fromJson(e))
          .toList(),
      knownForDepartment: getDepartmentTypeEnum(map['known_for_department']),
      name: map['name'],
      originalName: map['original_name'],
      popularity: map['popularity'],
      profilePath: map['profile_path'],
    );
  }
}
