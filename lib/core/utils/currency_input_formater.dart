import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter extends TextInputFormatter {
  final _formatter = NumberFormat.currency(locale: 'en_NG', symbol: '₦');

  @override
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    // Remove any non-digit characters from the new value
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // If the new text is empty or only has a single digit, return it as is
    if (newText.isEmpty || int.parse(newText) == 0) {
      return newValue.copyWith(text: newText);
    }

    // Convert the new value to a double
    double value = double.parse(newText) / 100.0;

    // Format the double to a currency string
    String newFormat = _formatter.format(value);

    // Remove the currency symbol
    newFormat = newFormat.replaceAll(_formatter.currencySymbol, '');

    // Return the new text with the cursor position preserved
    return newValue.copyWith(
      text: newFormat,
      selection: TextSelection.collapsed(offset: newFormat.length),
    );
  }
}

