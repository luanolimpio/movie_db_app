import 'package:micro_common/micro_common.dart';
import 'package:micro_common/src/utils/services/cache/cache.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

class CommonInterceptor extends Interceptor {
  final ICacheService _cacheService;
  final _cacheDuration = 10;

  CommonInterceptor(this._cacheService);

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.requestOptions.method == 'GET' &&
        (response.requestOptions.extra['useCache'] ?? false)) {
      final id = '${response.requestOptions.method}-${response.requestOptions.path}';
      final cacheData = await _cacheService.get(id);
      if (cacheData == null ||
          DateTime.now().difference(cacheData.date).inMinutes >
              _cacheDuration) {
        _cacheService.put(
          HiveCacheModel(
            id: id,
            data: response.data,
            date: DateTime.now(),
          ),
        );
      }
    }
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == null &&
        (err.requestOptions.extra['useCache'] ?? false)) {
      final id = '${err.requestOptions.method}-${err.requestOptions.path}';
      final cacheData = await _cacheService.get(id);
      if (cacheData != null) {
        handler.resolve(
          Response(
            requestOptions: err.requestOptions,
            data: cacheData.data,
            statusCode: 200,
          ),
        );
        return;
      }
    }
    super.onError(err, handler);
  }
}
