import 'dart:ui';

import 'package:micro_core/micro_core.dart';

import 'core/injector/injector.dart';
import 'core/routes/tv_show_routes.dart';
import 'tv_shows/presentation/screens/tv_show_details_screen.dart';

class MicroAppTVShowResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_tv_show';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        TVShowRoutes.details: (_, args) =>
            TVShowDetailsScreen(tvShowId: args as int),
      };

  @override
  VoidCallback get injection => Injector.initialize;
}
