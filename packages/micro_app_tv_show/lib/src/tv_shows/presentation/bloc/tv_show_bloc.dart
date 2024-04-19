import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/usecases/get_on_the_air_usecase.dart';
import 'tv_show_event.dart';
import 'tv_show_state.dart';

class TVShowBloc extends Bloc<TVShowEvent, TVShowState> {
  final GetOnTheAirUseCase _getOnTheAirUseCase;

  TVShowBloc(
    this._getOnTheAirUseCase,
  ) : super(const TVShowInitial()) {
    on<GetOnTheAirEvent>(_getOnTheAir);
  }

  Future<void> _getOnTheAir(
    TVShowEvent event,
    Emitter<TVShowState> emit,
  ) async {
    emit(const TVShowLoading());
    final result = await _getOnTheAirUseCase();
    result.fold(
      (error) => emit(TVShowError(message: (error as ApiException).message)),
      (tvShows) => emit(TVShowSuccess(tvShows: tvShows)),
    );
  }
}
