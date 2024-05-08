import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../search/data/datasources/i_search_datasource.dart';
import '../../search/data/datasources/search_datasource.dart';
import '../../search/data/repositories/search_repository.dart';
import '../../search/domain/repositories/i_search_repository.dart';
import '../../search/domain/usecases/search_by_name_usecase.dart';
import '../../search/presentation/delegates/custom_search_delegate.dart';

class Injector {
  static void initialize() {
    final GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<ISearchDatasource>(() => SearchDatasource(
          Dio(
            BaseOptions(
              baseUrl: APIInfo.baseUrl,
            ),
          ),
        ));

    getIt.registerLazySingleton<ISearchRepository>(
      () => SearchRepository(getIt()),
    );

    getIt.registerLazySingleton<SearchByNameUseCase>(
      () => SearchByNameUseCase(getIt()),
    );

    getIt.registerFactory(() => CustomSearchDelegate(getIt()));
  }
}
