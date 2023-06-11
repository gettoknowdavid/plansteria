// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:stacked/stacked.dart';

const String NameValueKey = 'name';
const String PhoneValueKey = 'phone';
const String ImageValueKey = 'image';

final Map<String, TextEditingController>
    _EditProfileSheetTextEditingControllers = {};

final Map<String, FocusNode> _EditProfileSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _EditProfileSheetTextValidations =
    {
  NameValueKey: Validators.validateName,
  PhoneValueKey: Validators.validatePhone,
  ImageValueKey: null,
};

mixin $EditProfileSheet {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);
  TextEditingController get imageController =>
      _getFormTextEditingController(ImageValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);
  FocusNode get imageFocusNode => _getFormFocusNode(ImageValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_EditProfileSheetTextEditingControllers.containsKey(key)) {
      return _EditProfileSheetTextEditingControllers[key]!;
    }

    _EditProfileSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditProfileSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditProfileSheetFocusNodes.containsKey(key)) {
      return _EditProfileSheetFocusNodes[key]!;
    }
    _EditProfileSheetFocusNodes[key] = FocusNode();
    return _EditProfileSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    imageController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    imageController.addListener(() => _updateFormData(model));
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
          NameValueKey: nameController.text,
          PhoneValueKey: phoneController.text,
          ImageValueKey: imageController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditProfileSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditProfileSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _EditProfileSheetTextEditingControllers.clear();
    _EditProfileSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;
  String? get imageValue => this.formValueMap[ImageValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          NameValueKey: value,
        }),
    );

    if (_EditProfileSheetTextEditingControllers.containsKey(NameValueKey)) {
      _EditProfileSheetTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PhoneValueKey: value,
        }),
    );

    if (_EditProfileSheetTextEditingControllers.containsKey(PhoneValueKey)) {
      _EditProfileSheetTextEditingControllers[PhoneValueKey]?.text =
          value ?? '';
    }
  }

  set imageValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          ImageValueKey: value,
        }),
    );

    if (_EditProfileSheetTextEditingControllers.containsKey(ImageValueKey)) {
      _EditProfileSheetTextEditingControllers[ImageValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);
  bool get hasImage =>
      this.formValueMap.containsKey(ImageValueKey) &&
      (imageValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;
  bool get hasImageValidationMessage =>
      this.fieldsValidationMessages[ImageValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
  String? get imageValidationMessage =>
      this.fieldsValidationMessages[ImageValueKey];
}

extension Methods on FormViewModel {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;
  setImageValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ImageValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    phoneValue = '';
    imageValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      ImageValueKey: getValidationMessage(ImageValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _EditProfileSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _EditProfileSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      ImageValueKey: getValidationMessage(ImageValueKey),
    });
