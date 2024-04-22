import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/usecases/get_tv_shows_on_the_air_usecase.dart';
import '../../domain/usecases/get_tv_show_details_usecase.dart';
import 'tv_show_event.dart';
import 'tv_show_state.dart';

class TVShowBloc extends Bloc<TVShowEvent, TVShowState> {
  final GetTVShowsOnTheAirUseCase _getOnTheAirUseCase;
  final GetTVShowDetailsUseCase _getTVShowDetailsUseCase;

  TVShowBloc(
    this._getOnTheAirUseCase,
    this._getTVShowDetailsUseCase,
  ) : super(const TVShowInitial()) {
    on<GetTVShowsOnTheAirEvent>(_getOnTheAir);
    on<GetTVShowDetailsEvent>(_getDetails);
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

  Future<void> _getDetails(
    GetTVShowDetailsEvent event,
    Emitter<TVShowState> emit,
  ) async {
    emit(const TVShowDetailsLoading());
    final result = await _getTVShowDetailsUseCase(event.id);
    result.fold(
      (error) => emit(TVShowDetailsError(message: (error as ApiException).message)),
      (details) => emit(TVShowDetailsSuccess(details: details)),
    );
  }
}
