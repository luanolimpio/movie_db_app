import 'package:micro_dependencies/micro_dependencies.dart';

class CreatedByEntity extends Equatable {
  const CreatedByEntity({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    this.profilePath,
  });

  final int id;
  final String creditId;
  final String name;
  final int gender;
  final String? profilePath;

  @override
  String toString() {
    return 'CreatedByEntity(id: $id, creditId: $creditId, name: $name, gender: $gender, profilePath: $profilePath)';
  }

  @override
  List<Object?> get props => [
        id,
        creditId,
        name,
        gender,
        profilePath,
      ];
}
