import 'dart:ui';

import 'package:micro_core/micro_core.dart';

import 'core/injector/injector.dart';

class MicroAppTVShowResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_tv_show';

  @override
  Map<String, WidgetBuilderArgs> get routes => {};

  @override
  VoidCallback get injection => Injector.initialize;
}
