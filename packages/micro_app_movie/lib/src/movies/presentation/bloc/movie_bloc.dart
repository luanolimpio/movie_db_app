import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../core/enums/movie_type_enum.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMoviesUseCase _getMoviesUseCase;
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieBloc(
    this._getMoviesUseCase,
    this._getMovieDetailsUseCase,
  ) : super(const MovieInitial()) {
    on<GetMoviesNowPlayingEvent>(_getNowPlaying);
    on<GetMovieDetailsEvent>(_getDetails);
  }

  Future<void> _getNowPlaying(
    MovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(const MovieLoading());
    final result = await _getMoviesUseCase(MovieTypeEnum.nowPlaying);
    result.fold(
      (error) => emit(MovieError(message: (error as ApiException).message)),
      (movies) => emit(MovieSuccess(movies: movies)),
    );
  }

  Future<void> _getDetails(
    GetMovieDetailsEvent event,
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
