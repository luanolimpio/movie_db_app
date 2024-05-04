import '../../../core/enums/media_type_enum.dart';
import '../../domain/entities/known_for_entity.dart';

class KnownForModel extends KnownForEntity {
  const KnownForModel({
    required super.id,
    required super.mediaType,
    required super.title,
    required super.originalTitle,
    required super.posterPath,
  });

  factory KnownForModel.fromJson(Map<String, dynamic> map) {
    final mediaType = getMediaTypeEnum(map['media_type']);
    final title = mediaType == MediaTypeEnum.movie ? 'title': 'name';
    return KnownForModel(
      id: map['id'],
      mediaType: mediaType,
      title: map[title],
      originalTitle: map['original_$title'],
      posterPath: map['poster_path'],
    );
  }
}
