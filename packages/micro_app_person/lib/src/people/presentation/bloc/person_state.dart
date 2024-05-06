import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/person_details_entity.dart';
import '../../domain/entities/person_entity.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object?> get props => [];
}

class PersonInitial extends PersonState {
  const PersonInitial();
}

class PopularPeopleLoading extends PersonState {
  const PopularPeopleLoading();
}

class PopularPeopleSuccess extends PersonState {
  const PopularPeopleSuccess({
    required this.people,
  });

  final List<PersonEntity> people;

  @override
  List<Object?> get props => [people];
}

class PopularPeopleError extends PersonState {
  const PopularPeopleError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class PersonDetailsLoading extends PersonState {
  const PersonDetailsLoading();
}

class PersonDetailsSuccess extends PersonState {
  const PersonDetailsSuccess({required this.details});

  final PersonDetailsEntity details;

  @override
  List<Object?> get props => [details];
}

class PersonDetailsError extends PersonState {
  const PersonDetailsError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}