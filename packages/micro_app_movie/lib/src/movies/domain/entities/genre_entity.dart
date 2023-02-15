import 'package:micro_dependencies/micro_dependencies.dart';

class GenreEntity extends Equatable {
  const GenreEntity({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  String toString() {
    return 'GenreEntity(id: $id, name: $name)';
  }

  @override
  List<Object?> get props => [
    id,
    name,
  ];
}