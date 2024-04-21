import 'package:micro_dependencies/micro_dependencies.dart';

class NetworkEntity extends Equatable {
  const NetworkEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  @override
  String toString() {
    return 'NetworkEntity(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}