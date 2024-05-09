abstract class TVShowDetailsEvent {
  const TVShowDetailsEvent();
}

class GetTVShowDetailsEvent extends TVShowDetailsEvent {
  const GetTVShowDetailsEvent({required this.id});

  final int id;
}