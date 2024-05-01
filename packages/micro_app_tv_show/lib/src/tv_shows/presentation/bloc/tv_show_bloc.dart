import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/usecases/get_tv_show_details_usecase.dart';
import '../../domain/usecases/get_tv_shows_usecase.dart';
import 'tv_show_event.dart';
import 'tv_show_state.dart';

class TVShowBloc extends Bloc<TVShowEvent, TVShowState> {
  final GetTVShowsUseCase _getTVShowsUseCase;
  final GetTVShowDetailsUseCase _getTVShowDetailsUseCase;

  TVShowBloc(
    this._getTVShowsUseCase,
    this._getTVShowDetailsUseCase,
  ) : super(const TVShowInitial()) {
    on<GetTVShowsEvent>(_getTVShows);
    on<GetTVShowDetailsEvent>(_getDetails);
  }

  Future<void> _getTVShows(
    GetTVShowsEvent event,
    Emitter<TVShowState> emit,
  ) async {
    emit(const TVShowsLoading());
    final result = await _getTVShowsUseCase(event.type);
    result.fold(
      (error) => emit(TVShowsError(message: (error as ApiException).message)),
      (tvShows) => emit(TVShowsSuccess(tvShows: tvShows)),
    );
  }

  Future<void> _getDetails(
    GetTVShowDetailsEvent event,
    Emitter<TVShowState> emit,
  ) async {
    emit(const TVShowDetailsLoading());
    final result = await _getTVShowDetailsUseCase(event.id);
    result.fold(
      (error) =>
          emit(TVShowDetailsError(message: (error as ApiException).message)),
      (details) => emit(TVShowDetailsSuccess(details: details)),
    );
  }
}
