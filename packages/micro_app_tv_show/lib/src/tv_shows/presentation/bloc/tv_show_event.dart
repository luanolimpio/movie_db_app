abstract class TVShowEvent {
  const TVShowEvent();
}

class GetTVShowsOnTheAirEvent extends TVShowEvent {
  const GetTVShowsOnTheAirEvent();
}

class GetTVShowDetailsEvent extends TVShowEvent {
  const GetTVShowDetailsEvent({required this.id});

  final int id;
}