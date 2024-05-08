import 'package:micro_common/micro_common.dart';

class PersonDetailsArguments {
  const PersonDetailsArguments({
    required this.id,
    required this.knownFor,
  });

  final int id;
  final List<KnownForEntity> knownFor;
}
