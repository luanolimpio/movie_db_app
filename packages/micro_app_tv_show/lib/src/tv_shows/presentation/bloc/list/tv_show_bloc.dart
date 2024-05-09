import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/usecases/get_tv_shows_usecase.dart';
import 'tv_show_event.dart';
import 'tv_show_state.dart';

class TVShowBloc extends Bloc<TVShowEvent, TVShowState> {
  final GetTVShowsUseCase _getTVShowsUseCase;

  TVShowBloc(
    this._getTVShowsUseCase,
  ) : super(const TVShowInitial()) {
    on<GetTVShowsEvent>(_getTVShows);
  }

  Future<void> _getTVShows(
    GetTVShowsEvent event,
    Emitter<TVShowState> emit,
  ) async {
    emit(TVShowsLoading(
      currentPage: state.currentPage,
      totalPages: state.totalPages,
      tvShows: state.tvShows,
    ));
    final result = await _getTVShowsUseCase(
      type: event.type,
      page: state.currentPage,
    );
    result.fold(
      (error) => emit(
        TVShowsError(
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          tvShows: state.tvShows,
          message: (error as ApiException).message,
        ),
      ),
      (tvShow) => emit(
        TVShowsSuccess(
          currentPage: state.currentPage + 1,
          totalPages: state.totalPages,
          tvShows: [...state.tvShows, ...tvShow.results],
        ),
      ),
    );
  }
}
