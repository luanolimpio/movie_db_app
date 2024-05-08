import 'package:micro_common/micro_common.dart';

enum MediaTypeEnum {
  movie('title', 'poster'),
  tv('name', 'poster'),
  person('name', 'profile');

  const MediaTypeEnum(this.titlePath, this.posterPath);

  final String titlePath;
  final String posterPath;
}

MediaTypeEnum getMediaTypeEnum(String value) {
  return MediaTypeEnum.values.firstWhere(
    (typeEnum) => typeEnum.name.equalsIgnoreCase(value),
    orElse: () => MediaTypeEnum.movie,
  );
}
