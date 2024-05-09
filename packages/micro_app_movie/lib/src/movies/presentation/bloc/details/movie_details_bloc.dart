import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../../domain/usecases/get_movie_details_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsBloc(
    this._getMovieDetailsUseCase,
  ) : super(const MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>(_getDetails);
  }

  Future<void> _getDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(const MovieDetailsLoading());
    final result = await _getMovieDetailsUseCase(event.id);
    result.fold(
      (error) => emit(MovieDetailsError(message: (error as ApiException).message)),
      (details) => emit(MovieDetailsSuccess(details: details)),
    );
  }
}
