import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/usecases/get_tv_show_details_usecase.dart';
import 'tv_show_details_event.dart';
import 'tv_show_details_state.dart';

class TVShowDetailsBloc extends Bloc<TVShowDetailsEvent, TVShowDetailsState> {
  final GetTVShowDetailsUseCase _getTVShowDetailsUseCase;

  TVShowDetailsBloc(
    this._getTVShowDetailsUseCase,
  ) : super(const TVShowDetailsInitial()) {
    on<GetTVShowDetailsEvent>(_getDetails);
  }

  Future<void> _getDetails(
    GetTVShowDetailsEvent event,
    Emitter<TVShowDetailsState> emit,
  ) async {
    emit(const TVShowDetailsLoading());
    final result = await _getTVShowDetailsUseCase(event.id);
    result.fold(
      (error) => emit(TVShowDetailsError(message: (error as ApiException).message)),
      (details) => emit(TVShowDetailsSuccess(details: details)),
    );
  }
}
