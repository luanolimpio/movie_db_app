import '../../../../core/enums/tv_show_type_enum.dart';

abstract class TVShowEvent {
  const TVShowEvent();
}

class GetTVShowsEvent extends TVShowEvent {
  const GetTVShowsEvent({required this.type, this.useCache = false});

  final TVShowTypeEnum type;
  final bool useCache;
}
