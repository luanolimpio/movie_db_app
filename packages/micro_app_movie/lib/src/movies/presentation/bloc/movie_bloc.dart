import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_now_playing_usecase.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingUseCase _getNowPlayingUseCase;
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieBloc(
    this._getNowPlayingUseCase,
    this._getMovieDetailsUseCase,
  ) : super(const MovieInitial()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetDetailsEvent>(_getDetails);
  }

  Future<void> _getNowPlaying(
    MovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(const MovieLoading());
    final result = await _getNowPlayingUseCase();
    result.fold(
      (error) => emit(MovieError(message: (error as ApiException).message)),
      (movies) => emit(MovieSuccess(movies: movies)),
    );
  }

  Future<void> _getDetails(
    GetDetailsEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(const MovieDetailsLoading());
    final result = await _getMovieDetailsUseCase(event.id);
    result.fold(
      (error) => emit(MovieDetailsError(message: (error as ApiException).message)),
      (details) => emit(MovieDetailsSuccess(details: details)),
    );
  }
}
