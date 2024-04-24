import 'package:micro_common/micro_common.dart';

enum StatusEnum {
  released('Lançado'),
  inProduction('Em Produção'),
  postProduction('Pós-Produção');

  const StatusEnum(this.value);

  final String value;
}

StatusEnum getStatusEnum(String value) {
  return StatusEnum.values.firstWhere(
    (statusEnum) => statusEnum.name.equalsIgnoreCase(value.replaceAll(' ', '')),
    orElse: () => StatusEnum.released,
  );
}
