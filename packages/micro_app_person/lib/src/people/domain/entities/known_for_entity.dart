import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/media_type_enum.dart';

class KnownForEntity extends Equatable {
  const KnownForEntity({
    required this.id,
    required this.mediaType,
    required this.title,
    required this.originalTitle,
    required this.posterPath,
  });

  final int id;
  final MediaTypeEnum mediaType;
  final String title;
  final String originalTitle;
  final String posterPath;

  @override
  String toString() {
    return 'KnownForEntity(id: $id,'
        ' mediaType: $mediaType,'
        ' title: $title,'
        ' originalTitle: $originalTitle,'
        ' posterPath: $posterPath)';
  }

  @override
  List<Object?> get props => [
        id,
        mediaType,
        title,
        originalTitle,
        posterPath,
      ];
}
