import '../../domain/entities/network_entity.dart';

class NetworkModel extends NetworkEntity {
  const NetworkModel({
    required super.id,
    required super.logoPath,
    required super.name,
    required super.originCountry,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> map) {
    return NetworkModel(
      id: map['id'],
      logoPath: map['logo_path'],
      name: map['name'],
      originCountry: map['origin_country'],
    );
  }
}