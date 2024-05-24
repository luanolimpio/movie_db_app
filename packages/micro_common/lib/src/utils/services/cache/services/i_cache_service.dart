import '../entities/cache_entity.dart';

abstract class ICacheService {
  Future<CacheEntity?> get(String id);

  Future<void> put(CacheEntity data);
}
