enum DSImageTypeEnum {
  emptyBox('empty_box');

  const DSImageTypeEnum(this._title);

  final String _title;

  String get path => 'assets/images/$_title.png';
}
