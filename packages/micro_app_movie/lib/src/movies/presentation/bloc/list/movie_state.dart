import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/entities/movie_result_entity.dart';

abstract class MovieState extends Equatable {
  const MovieState({
    required this.currentPage,
    required this.totalPages,
    required this.movies,
  });

  final int currentPage;
  final int totalPages;
  final List<MovieResultEntity> movies;

  @override
  List<Object?> get props => [currentPage, totalPages, movies];
}

class MovieInitial extends MovieState {
  const MovieInitial()
      : super(
          currentPage: 1,
          totalPages: 0,
          movies: const [],
        );
}

class MoviesLoading extends MovieState {
  const MoviesLoading({
    required super.currentPage,
    required super.totalPages,
    required super.movies,
  });
}

class MoviesSuccess extends MovieState {
  const MoviesSuccess({
    required super.currentPage,
    required super.totalPages,
    required super.movies,
  });
}

class MoviesError extends MovieState {
  const MoviesError({
    required super.currentPage,
    required super.totalPages,
    required super.movies,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

