import 'package:micro_common/micro_common.dart';

import '../../domain/entities/multi_search_entity.dart';

class MultiSearchModel extends MultiSearchEntity {
  const MultiSearchModel({
    required super.adult,
    required super.id,
    required super.name,
    required super.originalName,
    required super.mediaType,
    super.overview,
    super.posterPath,
    super.knownFor,
  });

  factory MultiSearchModel.fromJson(Map<String, dynamic> map) {
    final mediaType = getMediaTypeEnum(map['media_type']);
    return MultiSearchModel(
      adult: map['adult'],
      id: map['id'],
      name: map[mediaType.titlePath],
      originalName: map['original_${mediaType.titlePath}'],
      overview: map['overview'],
      mediaType: mediaType,
      posterPath: map['${mediaType.posterPath}_path'],
      knownFor: map['known_for'] != null
          ? List.from(map['known_for'])
              .map((e) => KnownForModel.fromJson(e))
              .toList()
          : null,
    );
  }
}
