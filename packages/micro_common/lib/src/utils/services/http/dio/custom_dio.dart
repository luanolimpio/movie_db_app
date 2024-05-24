import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../api/api_info.dart';

class CustomDio extends DioForNative {
  CustomDio([List<Interceptor>? interceptors]) {
    options.baseUrl = APIInfo.baseUrl;
    if (interceptors != null) this.interceptors.addAll(interceptors);
  }
}
