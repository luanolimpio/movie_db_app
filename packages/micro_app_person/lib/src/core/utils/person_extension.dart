import '../../people/domain/entities/person_entity.dart';

extension PersonExtension on PersonEntity {
  String get knownForTitles {
    final buffer = StringBuffer();
    final list = knownFor.map((e) => e.title).toList();
    buffer.writeAll(list, ', ');
    return buffer.toString();
  }
}
