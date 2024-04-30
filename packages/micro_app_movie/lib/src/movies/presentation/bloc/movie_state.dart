import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_entity.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {
  const MovieInitial();
}

class MoviesLoading extends MovieState {
  const MoviesLoading();
}

class MoviesSuccess extends MovieState {
  const MoviesSuccess({
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  List<Object?> get props => [movies];
}

class MoviesError extends MovieState {
  const MoviesError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class MovieDetailsLoading extends MovieState {
  const MovieDetailsLoading();
}

class MovieDetailsSuccess extends MovieState {
  const MovieDetailsSuccess({required this.details});

  final MovieDetailsEntity details;

  @override
  List<Object?> get props => [details];
}

class MovieDetailsError extends MovieState {
  const MovieDetailsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
