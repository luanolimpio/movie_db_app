import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/usecases/get_person_details_usecase.dart';
import 'person_details_event.dart';
import 'person_details_state.dart';

class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  final GetPersonDetailsUseCase _getPersonDetailsUseCase;

  PersonDetailsBloc(
    this._getPersonDetailsUseCase,
  ) : super(const PersonDetailsInitial()) {
    on<GetPersonDetailsEvent>(_getDetails);
  }

  Future<void> _getDetails(
    GetPersonDetailsEvent event,
    Emitter<PersonDetailsState> emit,
  ) async {
    emit(const PersonDetailsLoading());
    final result = await _getPersonDetailsUseCase(event.id);
    result.fold(
      (error) => emit(PersonDetailsError(message: (error as ApiException).message)),
      (details) => emit(PersonDetailsSuccess(details: details)),
    );
  }
}
