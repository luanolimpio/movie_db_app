import 'package:micro_common/micro_common.dart';

class EventListener {
  static void initialize() {
    EventBus.listen(
      (event) {
        switch (event.runtimeType) {
          case GoToNowPlayingMoviesEvent:
            break;
          case GoToPopularMoviesEvent:
            break;
          case GoToUpcomingMoviesEvent:
            break;
          case GoToTopRatedMoviesEvent:
            break;
          default:
        }
      },
    );
  }
}
