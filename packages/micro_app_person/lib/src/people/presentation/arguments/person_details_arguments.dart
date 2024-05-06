import '../../domain/entities/known_for_entity.dart';

class PersonDetailsArguments {
  const PersonDetailsArguments({
    required this.id,
    required this.knownFor,
  });

  final int id;
  final List<KnownForEntity> knownFor;
}
