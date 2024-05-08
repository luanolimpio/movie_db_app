import '../../domain/entities/known_for_entity.dart';
import '../../utils/enums/media_type_enum.dart';

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
    return KnownForModel(
      id: map['id'],
      mediaType: mediaType,
      title: map[mediaType.titlePath],
      originalTitle: map['original_${mediaType.titlePath}'],
      posterPath: map['poster_path'],
    );
  }
}
