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
      knownForDepartment: map['known_for_department'],
      name: map['name'],
      popularity: map['popularity'],
      profilePath: map['profile_path'],
    );
  }
}
