import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/entities/tv_show_details_entity.dart';

abstract class TVShowDetailsState extends Equatable {
  const TVShowDetailsState();

  @override
  List<Object?> get props => [];
}

class TVShowDetailsInitial extends TVShowDetailsState {
  const TVShowDetailsInitial();
}

class TVShowDetailsLoading extends TVShowDetailsState {
  const TVShowDetailsLoading();
}

class TVShowDetailsSuccess extends TVShowDetailsState {
  const TVShowDetailsSuccess({required this.details});

  final TVShowDetailsEntity details;

  @override
  List<Object?> get props => [details];
}

class TVShowDetailsError extends TVShowDetailsState {
  const TVShowDetailsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
