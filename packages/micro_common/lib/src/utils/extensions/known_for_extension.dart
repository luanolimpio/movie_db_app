import 'package:micro_common/micro_common.dart';

extension KnownForExtension on List<KnownForEntity> {
  String get titles {
    final buffer = StringBuffer();
    final list = map((e) => e.title).toList();
    buffer.writeAll(list, ', ');
    return buffer.toString();
  }
}
