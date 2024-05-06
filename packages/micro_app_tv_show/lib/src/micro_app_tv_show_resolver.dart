import 'dart:ui';

import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import 'core/enums/tv_show_type_enum.dart';
import 'core/injector/injector.dart';
import 'core/routes/tv_show_routes.dart';
import 'tv_shows/presentation/arguments/seasons_arguments.dart';
import 'tv_shows/presentation/arguments/tv_shows_arguments.dart';
import 'tv_shows/presentation/bloc/tv_show_bloc.dart';
import 'tv_shows/presentation/screens/seasons_screen.dart';
import 'tv_shows/presentation/screens/tv_show_details_screen.dart';
import 'tv_shows/presentation/screens/tv_shows_screen.dart';

class MicroAppTVShowResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_tv_show';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        TVShowRoutes.list: (_, args) => BlocProvider<TVShowBloc>(
              create: (_) => GetIt.I<TVShowBloc>(),
              child: TVShowsScreen(
                arguments: args as TVShowsArguments,
              ),
            ),
        TVShowRoutes.details: (_, args) => TVShowDetailsScreen(
              tvShowId: args as int,
            ),
        TVShowRoutes.seasons: (_, args) => SeasonsScreen(
              arguments: args as SeasonsArguments,
            ),
      };

  @override
  VoidCallback get injection => Injector.initialize;

  @override
  VoidCallback get eventListener => () {
        EventBus.listen(
          (event) {
            switch (event.runtimeType) {
              case GoToTVShowsEvent:
                navigatorKey.currentState!.pushNamed(
                  TVShowRoutes.list,
                  arguments: TVShowsArguments(
                    type: (event as GoToTVShowsEvent).type as TVShowTypeEnum,
                  ),
                );
                break;
              case GoToTVShowDetailsEvent:
                navigatorKey.currentState!.pushNamed(
                  TVShowRoutes.details,
                  arguments: (event as GoToTVShowDetailsEvent).id,
                );
                break;
              default:
            }
          },
        );
      };
}
