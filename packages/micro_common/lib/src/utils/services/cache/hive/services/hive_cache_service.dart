import 'dart:async';

import 'package:micro_dependencies/micro_dependencies.dart';

import '../../entities/cache_entity.dart';
import '../../services/i_cache_service.dart';
import '../models/hive_cache_model.dart';

class HiveCacheService implements ICacheService {
  final _completer = Completer<Box>();

  HiveCacheService() {
    _init();
  }

  Future<void> _init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HiveCacheModelAdapter());
    }
    final box = await Hive.openBox('cache');
    if (!_completer.isCompleted) _completer.complete(box);
  }

  @override
  Future<CacheEntity?> get(String id) async {
    final box = await _completer.future;

    final data = await box.get(id);

    return data;
  }

  @override
  Future<void> put(CacheEntity data) async {
    final box = await _completer.future;

    box.put(data.id, data);
  }
}
