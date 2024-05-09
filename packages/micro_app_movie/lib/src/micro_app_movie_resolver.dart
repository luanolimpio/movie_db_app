import 'dart:ui';

import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import 'core/enums/movie_type_enum.dart';
import 'core/injector/injector.dart';
import 'core/routes/movie_routes.dart';

import 'movies/presentation/arguments/movies_arguments.dart';
import 'movies/presentation/bloc/list/movie_bloc.dart';
import 'movies/presentation/screens/movie_details_screen.dart';
import 'movies/presentation/screens/movies_screen.dart';

class MicroAppMovieResolver implements MicroApp {
  @override
  String get microAppName => 'micro_app_movie';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        MovieRoutes.list: (_, args) => BlocProvider<MovieBloc>(
              create: (_) => GetIt.I<MovieBloc>(),
              child: MoviesScreen(
                arguments: args as MoviesArguments,
              ),
            ),
        MovieRoutes.details: (_, args) =>
            MovieDetailsScreen(movieId: args as int),
      };

  @override
  VoidCallback get injection => Injector.initialize;

  @override
  VoidCallback get eventListener => () {
        EventBus.listen(
          (event) {
            switch (event.runtimeType) {
              case GoToMoviesEvent:
                navigatorKey.currentState!.pushNamed(
                  MovieRoutes.list,
                  arguments: MoviesArguments(
                    type: (event as GoToMoviesEvent).type as MovieTypeEnum,
                  ),
                );
                break;
              case GoToMovieDetailsEvent:
                navigatorKey.currentState!.pushNamed(
                  MovieRoutes.details,
                  arguments: (event as GoToMovieDetailsEvent).id,
                );
                break;
              default:
            }
          },
        );
      };
}
