// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:stacked/stacked.dart';

const String PasswordValueKey = 'password';

final Map<String, TextEditingController> _ReAuthSheetTextEditingControllers =
    {};

final Map<String, FocusNode> _ReAuthSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _ReAuthSheetTextValidations = {
  PasswordValueKey: Validators.validateLoginPassword,
};

mixin $ReAuthSheet {
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ReAuthSheetTextEditingControllers.containsKey(key)) {
      return _ReAuthSheetTextEditingControllers[key]!;
    }

    _ReAuthSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ReAuthSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ReAuthSheetFocusNodes.containsKey(key)) {
      return _ReAuthSheetFocusNodes[key]!;
    }
    _ReAuthSheetFocusNodes[key] = FocusNode();
    return _ReAuthSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    passwordController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    passwordController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PasswordValueKey: passwordController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ReAuthSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ReAuthSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _ReAuthSheetTextEditingControllers.clear();
    _ReAuthSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PasswordValueKey: value,
        }),
    );

    if (_ReAuthSheetTextEditingControllers.containsKey(PasswordValueKey)) {
      _ReAuthSheetTextEditingControllers[PasswordValueKey]?.text = value ?? '';
    }
  }

  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);

  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;

  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
}

extension Methods on FormViewModel {
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    passwordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ReAuthSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ReAuthSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      PasswordValueKey: getValidationMessage(PasswordValueKey),
    });
