import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/usecases/get_person_details_usecase.dart';
import '../../domain/usecases/get_popular_people_usecase.dart';
import 'person_event.dart';
import 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetPopularPeopleUseCase _getPopularPeopleUseCase;
  final GetPersonDetailsUseCase _getPersonDetailsUseCase;

  PersonBloc(
    this._getPopularPeopleUseCase,
    this._getPersonDetailsUseCase,
  ) : super(const PersonInitial()) {
    on<GetPopularPeopleEvent>(_getPopularPeople);
    on<GetPersonDetailsEvent>(_getDetails);
  }

  Future<void> _getPopularPeople(
    GetPopularPeopleEvent event,
    Emitter<PersonState> emit,
  ) async {
    emit(const PopularPeopleLoading());
    final result = await _getPopularPeopleUseCase();
    result.fold(
      (error) =>
          emit(PopularPeopleError(message: (error as ApiException).message)),
      (people) => emit(PopularPeopleSuccess(people: people)),
    );
  }

  Future<void> _getDetails(
    GetPersonDetailsEvent event,
    Emitter<PersonState> emit,
  ) async {
    emit(const PersonDetailsLoading());
    final result = await _getPersonDetailsUseCase(event.id);
    result.fold(
      (error) =>
          emit(PersonDetailsError(message: (error as ApiException).message)),
      (details) => emit(PersonDetailsSuccess(details: details)),
    );
  }
}
