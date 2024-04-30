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

class TVShowLoading extends TVShowState {
  const TVShowLoading();
}

class TVShowSuccess extends TVShowState {
  const TVShowSuccess({
    required this.tvShows,
  });

  final List<TVShowEntity> tvShows;

  @override
  List<Object?> get props => [tvShows];
}

class TVShowError extends TVShowState {
  const TVShowError({required this.message});

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
