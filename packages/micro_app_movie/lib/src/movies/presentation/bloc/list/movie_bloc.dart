import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/usecases/get_movies_usecase.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMoviesUseCase _getMoviesUseCase;

  MovieBloc(
    this._getMoviesUseCase,
  ) : super(const MovieInitial()) {
    on<GetMoviesEvent>(_getMovies);
  }

  Future<void> _getMovies(
    GetMoviesEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(MoviesLoading(
      currentPage: state.currentPage,
      totalPages: state.totalPages,
      movies: state.movies,
    ));
    final result = await _getMoviesUseCase(
      type: event.type,
      page: state.currentPage,
    );
    result.fold(
      (error) => emit(
        MoviesError(
          currentPage: state.currentPage,
          totalPages: state.totalPages,
          movies: state.movies,
          message: (error as ApiException).message,
        ),
      ),
      (movie) => emit(
        MoviesSuccess(
          currentPage: state.currentPage + 1,
          totalPages: state.totalPages,
          movies: [...state.movies, ...movie.results],
        ),
      ),
    );
  }
}
