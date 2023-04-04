// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:stacked/stacked.dart';

const String NameValueKey = 'name';
const String AddressValueKey = 'address';
const String NotesValueKey = 'notes';
const String PriceValueKey = 'price';
const String DateValueKey = 'date';

final Map<String, TextEditingController>
    _CreateEventSheetTextEditingControllers = {};

final Map<String, FocusNode> _CreateEventSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _CreateEventSheetTextValidations =
    {
  NameValueKey: Validators.validateName,
  AddressValueKey: Validators.validateName,
  NotesValueKey: null,
  PriceValueKey: null,
  DateValueKey: null,
};

mixin $CreateEventSheet on StatelessWidget {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  TextEditingController get notesController =>
      _getFormTextEditingController(NotesValueKey);
  TextEditingController get priceController =>
      _getFormTextEditingController(PriceValueKey);
  TextEditingController get dateController =>
      _getFormTextEditingController(DateValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);
  FocusNode get notesFocusNode => _getFormFocusNode(NotesValueKey);
  FocusNode get priceFocusNode => _getFormFocusNode(PriceValueKey);
  FocusNode get dateFocusNode => _getFormFocusNode(DateValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CreateEventSheetTextEditingControllers.containsKey(key)) {
      return _CreateEventSheetTextEditingControllers[key]!;
    }
    _CreateEventSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateEventSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateEventSheetFocusNodes.containsKey(key)) {
      return _CreateEventSheetFocusNodes[key]!;
    }
    _CreateEventSheetFocusNodes[key] = FocusNode();
    return _CreateEventSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
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
          AddressValueKey: addressController.text,
          NotesValueKey: notesController.text,
          PriceValueKey: priceController.text,
          DateValueKey: dateController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        NameValueKey: _getValidationMessage(NameValueKey),
        AddressValueKey: _getValidationMessage(AddressValueKey),
        NotesValueKey: _getValidationMessage(NotesValueKey),
        PriceValueKey: _getValidationMessage(PriceValueKey),
        DateValueKey: _getValidationMessage(DateValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CreateEventSheetTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_CreateEventSheetTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreateEventSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateEventSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateEventSheetTextEditingControllers.clear();
    _CreateEventSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;
  String? get notesValue => this.formValueMap[NotesValueKey] as String?;
  String? get priceValue => this.formValueMap[PriceValueKey] as String?;
  String? get dateValue => this.formValueMap[DateValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          NameValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(NameValueKey)) {
      _CreateEventSheetTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set addressValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AddressValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(AddressValueKey)) {
      _CreateEventSheetTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  set notesValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          NotesValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(NotesValueKey)) {
      _CreateEventSheetTextEditingControllers[NotesValueKey]?.text =
          value ?? '';
    }
  }

  set priceValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PriceValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(PriceValueKey)) {
      _CreateEventSheetTextEditingControllers[PriceValueKey]?.text =
          value ?? '';
    }
  }

  set dateValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          DateValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(DateValueKey)) {
      _CreateEventSheetTextEditingControllers[DateValueKey]?.text = value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);
  bool get hasNotes =>
      this.formValueMap.containsKey(NotesValueKey) &&
      (notesValue?.isNotEmpty ?? false);
  bool get hasPrice =>
      this.formValueMap.containsKey(PriceValueKey) &&
      (priceValue?.isNotEmpty ?? false);
  bool get hasDate =>
      this.formValueMap.containsKey(DateValueKey) &&
      (dateValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;
  bool get hasNotesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey]?.isNotEmpty ?? false;
  bool get hasPriceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey]?.isNotEmpty ?? false;
  bool get hasDateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
  String? get notesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey];
  String? get priceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey];
  String? get dateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey];
  void clearForm() {
    nameValue = '';
    addressValue = '';
    notesValue = '';
    priceValue = '';
    dateValue = '';
  }
}

extension Methods on FormViewModel {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;
  setNotesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NotesValueKey] = validationMessage;
  setPriceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PriceValueKey] = validationMessage;
  setDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DateValueKey] = validationMessage;
}
