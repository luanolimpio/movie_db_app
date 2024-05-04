import 'package:micro_common/micro_common.dart';

enum DepartmentTypeEnum {
  acting('Atuação'),
  production('Produção');

  const DepartmentTypeEnum(this.value);

  final String value;
}

DepartmentTypeEnum getDepartmentTypeEnum(String value) {
  return DepartmentTypeEnum.values.firstWhere(
    (typeEnum) => typeEnum.name.equalsIgnoreCase(value),
    orElse: () => DepartmentTypeEnum.acting,
  );
}
