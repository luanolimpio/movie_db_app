import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/tv_show_details_entity.dart';
import '../../domain/entities/tv_show_entity.dart';

abstract class TVShowState extends Equatable {
  const TVShowState();

  @override
  List<Object?> get props => [];
}

class TVShowInitial extends TVShowState {
  const TVShowInitial();
}

class TVShowsLoading extends TVShowState {
  const TVShowsLoading();
}

class TVShowsSuccess extends TVShowState {
  const TVShowsSuccess({
    required this.tvShows,
  });

  final List<TVShowEntity> tvShows;

  @override
  List<Object?> get props => [tvShows];
}

class TVShowsError extends TVShowState {
  const TVShowsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class TVShowDetailsLoading extends TVShowState {
  const TVShowDetailsLoading();
}

class TVShowDetailsSuccess extends TVShowState {
  const TVShowDetailsSuccess({required this.details});

  final TVShowDetailsEntity details;

  @override
  List<Object?> get props => [details];
}

class TVShowDetailsError extends TVShowState {
  const TVShowDetailsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
