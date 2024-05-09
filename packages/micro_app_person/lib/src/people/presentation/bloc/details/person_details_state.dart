import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/entities/person_details_entity.dart';

abstract class PersonDetailsState extends Equatable {
  const PersonDetailsState();

  @override
  List<Object?> get props => [];
}

class PersonDetailsInitial extends PersonDetailsState {
  const PersonDetailsInitial();
}

class PersonDetailsLoading extends PersonDetailsState {
  const PersonDetailsLoading();
}

class PersonDetailsSuccess extends PersonDetailsState {
  const PersonDetailsSuccess({required this.details});

  final PersonDetailsEntity details;

  @override
  List<Object?> get props => [details];
}

class PersonDetailsError extends PersonDetailsState {
  const PersonDetailsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}