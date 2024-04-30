import 'package:micro_common/micro_common.dart';
import 'package:micro_core/micro_core.dart';

import '../../../micro_app_movie.dart';
import '../../movies/presentation/arguments/movies_arguments.dart';
import '../routes/movie_routes.dart';

class EventListener {
  static void initialize() {
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
          default:
        }
      },
    );
  }
}
