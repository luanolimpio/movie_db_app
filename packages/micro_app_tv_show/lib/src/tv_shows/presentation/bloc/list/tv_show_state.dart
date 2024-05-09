import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/entities/tv_show_result_entity.dart';

abstract class TVShowState extends Equatable {
  const TVShowState({
    required this.currentPage,
    required this.totalPages,
    required this.tvShows,
  });

  final int currentPage;
  final int totalPages;
  final List<TVShowResultEntity> tvShows;

  @override
  List<Object?> get props => [currentPage, totalPages, tvShows];
}

class TVShowInitial extends TVShowState {
  const TVShowInitial()
      : super(
          currentPage: 1,
          totalPages: 0,
          tvShows: const [],
        );
}

class TVShowsLoading extends TVShowState {
  const TVShowsLoading({
    required super.currentPage,
    required super.totalPages,
    required super.tvShows,
  });
}

class TVShowsSuccess extends TVShowState {
  const TVShowsSuccess({
    required super.currentPage,
    required super.totalPages,
    required super.tvShows,
  });
}

class TVShowsError extends TVShowState {
  const TVShowsError({
    required super.currentPage,
    required super.totalPages,
    required super.tvShows,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
