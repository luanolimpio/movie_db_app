import '../../../../core/enums/movie_type_enum.dart';

abstract class MovieEvent {
  const MovieEvent();
}

class GetMoviesEvent extends MovieEvent {
  const GetMoviesEvent({required this.type});

  final MovieTypeEnum type;
}


