import '../../i_event.dart';

class GoToTVShowsEvent extends IEvent {
  const GoToTVShowsEvent({
    required this.type,
  });

  final Enum type;
}
