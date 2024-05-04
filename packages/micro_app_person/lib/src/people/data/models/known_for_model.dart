import '../../../core/enums/media_type_enum.dart';
import '../../domain/entities/known_for_entity.dart';

class KnownForModel extends KnownForEntity {
  const KnownForModel({
    required super.id,
    required super.mediaType,
    required super.originalTitle,
    required super.title,
    required super.posterPath,
  });

  factory KnownForModel.fromJson(Map<String, dynamic> map) {
    return KnownForModel(
      id: map['id'],
      mediaType: getMediaTypeEnum(map['media_type']),
      originalTitle: map['original_title'],
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }
}
