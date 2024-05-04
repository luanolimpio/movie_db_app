import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/person_entity.dart';
import '../models/person_model.dart';
import 'i_person_datasource.dart';

class PersonDatasource implements IPersonDatasource {
  final Dio _dioClient;

  PersonDatasource(this._dioClient);

  @override
  Future<Either<Exception, List<PersonEntity>>> getList() async {
    try {
      final result = await _dioClient.get(
        'person/popular?api_key=${APIInfo.key}&language=${APIInfo.language}',
      );
      if (result.statusCode == 200) {
        final List<PersonEntity> list = (result.data['results'] as List)
            .map((dynamic json) => PersonModel.fromJson(json))
            .toList();
        return Right(list);
      }
      return Left(
        ApiException(
          'Não foi possível buscar pessoas populares. Por favor, tente novamente.',
        ),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
