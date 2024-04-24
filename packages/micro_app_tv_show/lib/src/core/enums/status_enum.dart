import 'package:micro_common/micro_common.dart';

enum StatusEnum {
  inProduction('Em Produção'),
  returningSeries('Renovada'),
  ended('Terminada');

  const StatusEnum(this.value);

  final String value;
}

StatusEnum getStatusEnum(String value) {
  return StatusEnum.values.firstWhere(
    (statusEnum) => statusEnum.name.equalsIgnoreCase(value.replaceAll(' ', '')),
    orElse: () => StatusEnum.inProduction,
  );
}
