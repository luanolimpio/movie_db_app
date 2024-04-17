import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';
import '../../movies/data/datasources/i_movie_datasource.dart';
import '../../movies/data/datasources/movie_datasource.dart';
import '../../movies/data/repositories/movie_repository.dart';
import '../../movies/domain/repositories/i_movie_repository.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_usecase.dart';
import '../../movies/presentation/bloc/movie_bloc.dart';

class Injector {
  static void initialize() {
    final GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IMovieDatasource>(() => MovieDatasource(
          Dio(
            BaseOptions(
              baseUrl: APIInfo.baseUrl,
            ),
          ),
        ));

    getIt.registerLazySingleton<IMovieRepository>(
      () => MovieRepository(getIt()),
    );

    getIt.registerLazySingleton<GetNowPlayingUseCase>(
      () => GetNowPlayingUseCase(getIt()),
    );

    getIt.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase(getIt()),
    );

    getIt.registerFactory(() => MovieBloc(getIt(), getIt()));
  }
}
