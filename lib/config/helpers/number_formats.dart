import 'package:intl/intl.dart';

class NumberFormats {
  static String number(double number) {
    final formattedNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '', locale: 'es')
            .format(number);
    return formattedNumber;
  }
}
