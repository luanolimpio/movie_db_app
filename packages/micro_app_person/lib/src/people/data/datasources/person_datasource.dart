import 'package:micro_app_person/src/people/domain/entities/person_details_entity.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_dependencies/micro_dependencies.dart';

import '../../domain/entities/person_entity.dart';
import '../models/person_details_model.dart';
import '../models/person_model.dart';
import 'i_person_datasource.dart';

class PersonDatasource implements IPersonDatasource {
  final Dio _dioClient;

  PersonDatasource(this._dioClient);

  @override
  Future<Either<Exception, PersonEntity>> getList({required int page}) async {
    try {
      final result = await _dioClient.get(
        'person/popular?api_key=${APIInfo.key}&language=${APIInfo.language}&page=$page',
      );
      if (result.statusCode == 200) {
        return Right(PersonModel.fromJson(result.data));
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

  @override
  Future<Either<Exception, PersonDetailsEntity>> getDetails(int id) async {
    try {
      final result = await _dioClient.get(
        'person/$id?api_key=${APIInfo.key}&language=${APIInfo.language}',
      );
      if (result.statusCode == 200) {
        return Right(PersonDetailsModel.fromJson(result.data));
      }
      return Left(
        ApiException(
          'Não foi possível buscar os detalhes. Por favor, tente novamente.',
        ),
      );
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }
}
