import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/entities/person_result_entity.dart';

abstract class PersonState extends Equatable {
  const PersonState({
    required this.currentPage,
    required this.totalPages,
    required this.people,
  });

  final int currentPage;
  final int totalPages;
  final List<PersonResultEntity> people;

  @override
  List<Object?> get props => [currentPage, totalPages, people];
}

class PersonInitial extends PersonState {
  const PersonInitial()
      : super(
          currentPage: 1,
          totalPages: 0,
          people: const [],
        );
}

class PopularPeopleLoading extends PersonState {
  const PopularPeopleLoading({
    required super.currentPage,
    required super.totalPages,
    required super.people,
  });
}

class PopularPeopleSuccess extends PersonState {
  const PopularPeopleSuccess({
    required super.currentPage,
    required super.totalPages,
    required super.people,
  });
}

class PopularPeopleError extends PersonState {
  const PopularPeopleError({
    required super.currentPage,
    required super.totalPages,
    required super.people,
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
