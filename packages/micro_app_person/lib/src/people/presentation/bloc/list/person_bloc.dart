import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/usecases/get_popular_people_usecase.dart';
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
    emit(PopularPeopleLoading(
      currentPage: state.currentPage,
      totalPages: state.totalPages,
      people: state.people,
    ));
    final result = await _getPopularPeopleUseCase(page: state.currentPage);
    result.fold(
      (error) => emit(
        PopularPeopleError(
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          people: state.people,
          message: (error as ApiException).message,
        ),
      ),
      (tvShow) => emit(
        PopularPeopleSuccess(
          currentPage: state.currentPage + 1,
          totalPages: state.totalPages,
          people: [...state.people, ...tvShow.results],
        ),
      ),
    );
  }
}
