import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../people/data/datasources/i_person_datasource.dart';
import '../../people/data/datasources/person_datasource.dart';
import '../../people/data/repositories/person_repository.dart';
import '../../people/domain/repositories/i_person_repository.dart';
import '../../people/domain/usecases/get_person_details_usecase.dart';
import '../../people/domain/usecases/get_popular_people_usecase.dart';
import '../../people/presentation/bloc/details/person_details_bloc.dart';
import '../../people/presentation/bloc/list/person_bloc.dart';

class Injector {
  static void initialize() {
    final GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IPersonDatasource>(() => PersonDatasource(
          Dio(
            BaseOptions(
              baseUrl: APIInfo.baseUrl,
            ),
          ),
        ));

    getIt.registerLazySingleton<IPersonRepository>(
      () => PersonRepository(getIt()),
    );

    getIt.registerLazySingleton<GetPopularPeopleUseCase>(
      () => GetPopularPeopleUseCase(getIt()),
    );

    getIt.registerLazySingleton<GetPersonDetailsUseCase>(
      () => GetPersonDetailsUseCase(getIt()),
    );

    getIt.registerFactory(() => PersonBloc(getIt()));

    getIt.registerFactory(() => PersonDetailsBloc(getIt()));
  }
}
