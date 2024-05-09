import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/entities/movie_details_entity.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial();
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsSuccess extends MovieDetailsState {
  const MovieDetailsSuccess({required this.details});

  final MovieDetailsEntity details;

  @override
  List<Object?> get props => [details];
}

class MovieDetailsError extends MovieDetailsState {
  const MovieDetailsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [...super.props, message];
}