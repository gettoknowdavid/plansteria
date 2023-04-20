import 'package:intl/intl.dart';

String formatNumber(int number) {
  final formatter = NumberFormat.compact();
  return formatter.format(number);
}
