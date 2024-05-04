import 'package:micro_common/micro_common.dart';

enum MediaTypeEnum {
  movie,
  tv,
}

MediaTypeEnum getMediaTypeEnum(String value) {
  return MediaTypeEnum.values.firstWhere(
    (typeEnum) => typeEnum.name.equalsIgnoreCase(value),
    orElse: () => MediaTypeEnum.movie,
  );
}
