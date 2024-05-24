import 'package:micro_dependencies/micro_dependencies.dart';

import '../../entities/cache_entity.dart';

part 'hive_cache_model.g.dart';

@HiveType(typeId: 0)
class HiveCacheModel extends HiveObject implements CacheEntity {
  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  @override
  final DateTime date;

  @HiveField(2)
  @override
  final Map<String, dynamic> data;

  HiveCacheModel({
    required this.id,
    required this.data,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
