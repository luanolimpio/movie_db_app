import '../../i_event.dart';

class GoToMoviesEvent extends IEvent {
  const GoToMoviesEvent({
    required this.type,
  });

  final Enum type;
}
