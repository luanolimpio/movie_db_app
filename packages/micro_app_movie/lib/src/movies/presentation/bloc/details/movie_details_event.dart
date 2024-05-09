abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  const GetMovieDetailsEvent({required this.id});

  final int id;
}
