import 'dart:ui';

import 'package:micro_core/src/micro_core_utils.dart';

abstract class MicroApp {
  String get microAppName;

  Map<String, WidgetBuilderArgs> get routes;

  VoidCallback get injection;

  VoidCallback get eventListener;
}
