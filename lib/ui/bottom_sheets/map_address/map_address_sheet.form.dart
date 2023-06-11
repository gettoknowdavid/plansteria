// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AddressValueKey = 'address';

final Map<String, TextEditingController>
    _MapAddressSheetTextEditingControllers = {};

final Map<String, FocusNode> _MapAddressSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _MapAddressSheetTextValidations =
    {
  AddressValueKey: null,
};

mixin $MapAddressSheet {
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_MapAddressSheetTextEditingControllers.containsKey(key)) {
      return _MapAddressSheetTextEditingControllers[key]!;
    }

    _MapAddressSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _MapAddressSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_MapAddressSheetFocusNodes.containsKey(key)) {
      return _MapAddressSheetFocusNodes[key]!;
    }
    _MapAddressSheetFocusNodes[key] = FocusNode();
    return _MapAddressSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    addressController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    addressController.addListener(() => _updateFormData(model));
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
          AddressValueKey: addressController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _MapAddressSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _MapAddressSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _MapAddressSheetTextEditingControllers.clear();
    _MapAddressSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;

  set addressValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AddressValueKey: value,
        }),
    );

    if (_MapAddressSheetTextEditingControllers.containsKey(AddressValueKey)) {
      _MapAddressSheetTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);

  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;

  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
}

extension Methods on FormViewModel {
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    addressValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _MapAddressSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _MapAddressSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
