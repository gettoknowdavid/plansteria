import 'app_strings.dart';

class Validators {
  static String? validateDate(String? value) {
    // Check if the value is empty
    if (value == null || value.isEmpty) {
      return 'Please enter a date';
    }

    // Parse the value as a DateTime object
    final DateTime? date = DateTime.tryParse(value);

    // Check if the value is a valid date
    if (date == null) {
      return 'Please enter a valid date';
    }

    // Return null if the value is valid
    return null;
  }

  static String? validateEmail(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Email cannot be empty';
    }

    if (RegExp(emailRegex).hasMatch(input)) {
      return null;
    }

    return 'Please provide a valid email';
  }

  static String? validateLoginPassword(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    return null;
  }

  static String? validateName(String? input) {
    if (input == null || input.isEmpty) {
      return 'Name cannot be empty';
    }

    return null;
  }

  static String? validatePassword(String? input) {
    if (input == null || input.isEmpty == true) {
      return 'Password cannot be empty';
    }

    if (RegExp(passwordRegex).hasMatch(input)) {
      return null;
    }

    return 'Please provide a valid password';
  }

  static String? validatePhone(String? input) {
    if (input != null && (input.length != 10 || input.length != 11)) {
      return 'Phone Number must be 11 digits';
    } else {
      return null;
    }
  }
}
