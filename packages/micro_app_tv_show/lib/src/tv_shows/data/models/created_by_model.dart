import '../../domain/entities/created_by_entity.dart';

class CreatedByModel extends CreatedByEntity {
  const CreatedByModel({
    required super.id,
    required super.creditId,
    required super.name,
    required super.gender,
    required super.profilePath,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> map) {
    return CreatedByModel(
      id: map['id'],
      creditId: map['credit_id'],
      name: map['name'],
      gender: map['gender'],
      profilePath: map['profile_path'],
    );
  }
}
