import '../../i_event.dart';

class GoToMoviesEvent extends IEvent {
  const GoToMoviesEvent({
    required this.type,
  });

  final Enum type;
}

class GoToMovieDetailsEvent extends IEvent {
  const GoToMovieDetailsEvent({
    required this.id,
  });

  final int id;
}
