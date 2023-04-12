// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:stacked/stacked.dart';

const String NameValueKey = 'name';
const String DescriptionValueKey = 'description';
const String AddressValueKey = 'address';
const String NotesValueKey = 'notes';
const String PriceValueKey = 'price';
const String DateValueKey = 'date';
const String StartTimeValueKey = 'startTime';
const String EndTimeValueKey = 'endTime';

final Map<String, TextEditingController>
    _CreateEventSheetTextEditingControllers = {};

final Map<String, FocusNode> _CreateEventSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _CreateEventSheetTextValidations =
    {
  NameValueKey: Validators.validateName,
  DescriptionValueKey: null,
  AddressValueKey: Validators.validateName,
  NotesValueKey: null,
  PriceValueKey: null,
  DateValueKey: Validators.validateDate,
  StartTimeValueKey: Validators.validateDate,
  EndTimeValueKey: null,
};

mixin $CreateEventSheet on StatelessWidget {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  TextEditingController get notesController =>
      _getFormTextEditingController(NotesValueKey);
  TextEditingController get priceController =>
      _getFormTextEditingController(PriceValueKey);
  TextEditingController get dateController =>
      _getFormTextEditingController(DateValueKey);
  TextEditingController get startTimeController =>
      _getFormTextEditingController(StartTimeValueKey);
  TextEditingController get endTimeController =>
      _getFormTextEditingController(EndTimeValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);
  FocusNode get notesFocusNode => _getFormFocusNode(NotesValueKey);
  FocusNode get priceFocusNode => _getFormFocusNode(PriceValueKey);
  FocusNode get dateFocusNode => _getFormFocusNode(DateValueKey);
  FocusNode get startTimeFocusNode => _getFormFocusNode(StartTimeValueKey);
  FocusNode get endTimeFocusNode => _getFormFocusNode(EndTimeValueKey);

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
    descriptionController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
    startTimeController.addListener(() => _updateFormData(model));
    endTimeController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
    startTimeController.addListener(() => _updateFormData(model));
    endTimeController.addListener(() => _updateFormData(model));
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
          DescriptionValueKey: descriptionController.text,
          AddressValueKey: addressController.text,
          NotesValueKey: notesController.text,
          PriceValueKey: priceController.text,
          DateValueKey: dateController.text,
          StartTimeValueKey: startTimeController.text,
          EndTimeValueKey: endTimeController.text,
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
        DescriptionValueKey: _getValidationMessage(DescriptionValueKey),
        AddressValueKey: _getValidationMessage(AddressValueKey),
        NotesValueKey: _getValidationMessage(NotesValueKey),
        PriceValueKey: _getValidationMessage(PriceValueKey),
        DateValueKey: _getValidationMessage(DateValueKey),
        StartTimeValueKey: _getValidationMessage(StartTimeValueKey),
        EndTimeValueKey: _getValidationMessage(EndTimeValueKey),
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
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;
  String? get notesValue => this.formValueMap[NotesValueKey] as String?;
  String? get priceValue => this.formValueMap[PriceValueKey] as String?;
  String? get dateValue => this.formValueMap[DateValueKey] as String?;
  String? get startTimeValue => this.formValueMap[StartTimeValueKey] as String?;
  String? get endTimeValue => this.formValueMap[EndTimeValueKey] as String?;

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

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          DescriptionValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _CreateEventSheetTextEditingControllers[DescriptionValueKey]?.text =
          value ?? '';
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

  set startTimeValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          StartTimeValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(
        StartTimeValueKey)) {
      _CreateEventSheetTextEditingControllers[StartTimeValueKey]?.text =
          value ?? '';
    }
  }

  set endTimeValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          EndTimeValueKey: value,
        }),
    );

    if (_CreateEventSheetTextEditingControllers.containsKey(EndTimeValueKey)) {
      _CreateEventSheetTextEditingControllers[EndTimeValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);
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
  bool get hasStartTime =>
      this.formValueMap.containsKey(StartTimeValueKey) &&
      (startTimeValue?.isNotEmpty ?? false);
  bool get hasEndTime =>
      this.formValueMap.containsKey(EndTimeValueKey) &&
      (endTimeValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;
  bool get hasNotesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey]?.isNotEmpty ?? false;
  bool get hasPriceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey]?.isNotEmpty ?? false;
  bool get hasDateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey]?.isNotEmpty ?? false;
  bool get hasStartTimeValidationMessage =>
      this.fieldsValidationMessages[StartTimeValueKey]?.isNotEmpty ?? false;
  bool get hasEndTimeValidationMessage =>
      this.fieldsValidationMessages[EndTimeValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
  String? get notesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey];
  String? get priceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey];
  String? get dateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey];
  String? get startTimeValidationMessage =>
      this.fieldsValidationMessages[StartTimeValueKey];
  String? get endTimeValidationMessage =>
      this.fieldsValidationMessages[EndTimeValueKey];
  void clearForm() {
    nameValue = '';
    descriptionValue = '';
    addressValue = '';
    notesValue = '';
    priceValue = '';
    dateValue = '';
    startTimeValue = '';
    endTimeValue = '';
  }
}

extension Methods on FormViewModel {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;
  setNotesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NotesValueKey] = validationMessage;
  setPriceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PriceValueKey] = validationMessage;
  setDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DateValueKey] = validationMessage;
  setStartTimeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StartTimeValueKey] = validationMessage;
  setEndTimeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EndTimeValueKey] = validationMessage;
}
