abstract class MovieEvent {
  const MovieEvent();
}

class GetNowPlayingEvent extends MovieEvent {
  const GetNowPlayingEvent();
}

class GetDetailsEvent extends MovieEvent {
  const GetDetailsEvent({required this.id});

  final int id;
}

