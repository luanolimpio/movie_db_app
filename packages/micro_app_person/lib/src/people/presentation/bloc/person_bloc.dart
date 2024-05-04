import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/usecases/get_popular_people_usecase.dart';
import 'person_event.dart';
import 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetPopularPeopleUseCase _getPopularPeopleUseCase;

  PersonBloc(
    this._getPopularPeopleUseCase,
  ) : super(const PersonInitial()) {
    on<GetPopularPeopleEvent>(_getPopularPeople);
  }

  Future<void> _getPopularPeople(
    GetPopularPeopleEvent event,
    Emitter<PersonState> emit,
  ) async {
    emit(const PopularPeopleLoading());
    final result = await _getPopularPeopleUseCase();
    result.fold(
      (error) => emit(PopularPeopleError(message: (error as ApiException).message)),
      (people) => emit(PopularPeopleSuccess(people: people)),
    );
  }
}
