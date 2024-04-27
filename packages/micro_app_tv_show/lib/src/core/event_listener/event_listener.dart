import 'package:micro_common/micro_common.dart';

class EventListener {
  static void initialize() {
    EventBus.listen(
      (event) {
        switch (event.runtimeType) {
          case GoToPopularTvShowsEvent:
            break;
          case GoToAiringTodayTvShowsEvent:
            break;
          case GoToOnTheAirTvShowsEvent:
            break;
          case GoToTopRatedTvShowsEvent:
            break;
          default:
        }
      },
    );
  }
}
