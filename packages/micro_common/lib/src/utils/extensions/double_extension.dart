import 'package:micro_dependencies/micro_dependencies.dart';

final _formatter = NumberFormat.currency(
  locale: 'pt_BR',
  symbol: r'$',
  decimalDigits: 2,
);

extension DoubleExtension on double {
  String get toCurrency {
    return _formatter.format(this);
  }
}