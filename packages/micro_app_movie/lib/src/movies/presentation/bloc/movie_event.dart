abstract class MovieEvent {
  const MovieEvent();
}

class GetMoviesNowPlayingEvent extends MovieEvent {
  const GetMoviesNowPlayingEvent();
}

class GetMovieDetailsEvent extends MovieEvent {
  const GetMovieDetailsEvent({required this.id});

  final int id;
}

