enum GenderTypeEnum {
  notSpecified(0, 'Não especificado'),
  female(1, 'Feminino'),
  male(2, 'Masculino'),
  nonBinary(3, 'Não binário');

  const GenderTypeEnum(this.value, this.label);

  final int value;
  final String label;
}

GenderTypeEnum getGenderTypeEnum(int value) {
  return GenderTypeEnum.values.firstWhere(
    (typeEnum) => typeEnum.value == value,
    orElse: () => GenderTypeEnum.notSpecified,
  );
}
