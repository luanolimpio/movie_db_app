import '../../../core/enums/tv_show_type_enum.dart';

abstract class TVShowEvent {
  const TVShowEvent();
}

class GetTVShowsEvent extends TVShowEvent {
  const GetTVShowsEvent({required this.type});

  final TVShowTypeEnum type;
}

class GetTVShowDetailsEvent extends TVShowEvent {
  const GetTVShowDetailsEvent({required this.id});

  final int id;
}
