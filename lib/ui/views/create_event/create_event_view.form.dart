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
const String DateValueKey = 'date';
const String StartTimeValueKey = 'startTime';
const String EndTimeValueKey = 'endTime';
const String AddressValueKey = 'address';
const String StateValueKey = 'state';
const String CityValueKey = 'city';
const String NumberOfGuestsValueKey = 'numberOfGuests';
const String NotesValueKey = 'notes';
const String PriceValueKey = 'price';
const String EmailValueKey = 'email';
const String PhoneValueKey = 'phone';

final Map<String, TextEditingController>
    _CreateEventViewTextEditingControllers = {};

final Map<String, FocusNode> _CreateEventViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CreateEventViewTextValidations =
    {
  NameValueKey: Validators.validateName,
  DescriptionValueKey: null,
  DateValueKey: Validators.validateDate,
  StartTimeValueKey: Validators.validateDate,
  EndTimeValueKey: null,
  AddressValueKey: Validators.validateAddress,
  StateValueKey: null,
  CityValueKey: null,
  NumberOfGuestsValueKey: null,
  NotesValueKey: null,
  PriceValueKey: null,
  EmailValueKey: Validators.validateEmail,
  PhoneValueKey: Validators.validatePhone,
};

mixin $CreateEventView {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get dateController =>
      _getFormTextEditingController(DateValueKey);
  TextEditingController get startTimeController =>
      _getFormTextEditingController(StartTimeValueKey);
  TextEditingController get endTimeController =>
      _getFormTextEditingController(EndTimeValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  TextEditingController get stateController =>
      _getFormTextEditingController(StateValueKey);
  TextEditingController get cityController =>
      _getFormTextEditingController(CityValueKey);
  TextEditingController get numberOfGuestsController =>
      _getFormTextEditingController(NumberOfGuestsValueKey);
  TextEditingController get notesController =>
      _getFormTextEditingController(NotesValueKey);
  TextEditingController get priceController =>
      _getFormTextEditingController(PriceValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get dateFocusNode => _getFormFocusNode(DateValueKey);
  FocusNode get startTimeFocusNode => _getFormFocusNode(StartTimeValueKey);
  FocusNode get endTimeFocusNode => _getFormFocusNode(EndTimeValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);
  FocusNode get stateFocusNode => _getFormFocusNode(StateValueKey);
  FocusNode get cityFocusNode => _getFormFocusNode(CityValueKey);
  FocusNode get numberOfGuestsFocusNode =>
      _getFormFocusNode(NumberOfGuestsValueKey);
  FocusNode get notesFocusNode => _getFormFocusNode(NotesValueKey);
  FocusNode get priceFocusNode => _getFormFocusNode(PriceValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateEventViewTextEditingControllers.containsKey(key)) {
      return _CreateEventViewTextEditingControllers[key]!;
    }

    _CreateEventViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateEventViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateEventViewFocusNodes.containsKey(key)) {
      return _CreateEventViewFocusNodes[key]!;
    }
    _CreateEventViewFocusNodes[key] = FocusNode();
    return _CreateEventViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
    startTimeController.addListener(() => _updateFormData(model));
    endTimeController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    stateController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    numberOfGuestsController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    descriptionController.addListener(() => _updateFormData(model));
    dateController.addListener(() => _updateFormData(model));
    startTimeController.addListener(() => _updateFormData(model));
    endTimeController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    stateController.addListener(() => _updateFormData(model));
    cityController.addListener(() => _updateFormData(model));
    numberOfGuestsController.addListener(() => _updateFormData(model));
    notesController.addListener(() => _updateFormData(model));
    priceController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
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
          DescriptionValueKey: descriptionController.text,
          DateValueKey: dateController.text,
          StartTimeValueKey: startTimeController.text,
          EndTimeValueKey: endTimeController.text,
          AddressValueKey: addressController.text,
          StateValueKey: stateController.text,
          CityValueKey: cityController.text,
          NumberOfGuestsValueKey: numberOfGuestsController.text,
          NotesValueKey: notesController.text,
          PriceValueKey: priceController.text,
          EmailValueKey: emailController.text,
          PhoneValueKey: phoneController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreateEventViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateEventViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateEventViewTextEditingControllers.clear();
    _CreateEventViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get dateValue => this.formValueMap[DateValueKey] as String?;
  String? get startTimeValue => this.formValueMap[StartTimeValueKey] as String?;
  String? get endTimeValue => this.formValueMap[EndTimeValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;
  String? get stateValue => this.formValueMap[StateValueKey] as String?;
  String? get cityValue => this.formValueMap[CityValueKey] as String?;
  String? get numberOfGuestsValue =>
      this.formValueMap[NumberOfGuestsValueKey] as String?;
  String? get notesValue => this.formValueMap[NotesValueKey] as String?;
  String? get priceValue => this.formValueMap[PriceValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          NameValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(NameValueKey)) {
      _CreateEventViewTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set descriptionValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          DescriptionValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(
        DescriptionValueKey)) {
      _CreateEventViewTextEditingControllers[DescriptionValueKey]?.text =
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

    if (_CreateEventViewTextEditingControllers.containsKey(DateValueKey)) {
      _CreateEventViewTextEditingControllers[DateValueKey]?.text = value ?? '';
    }
  }

  set startTimeValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          StartTimeValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(StartTimeValueKey)) {
      _CreateEventViewTextEditingControllers[StartTimeValueKey]?.text =
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

    if (_CreateEventViewTextEditingControllers.containsKey(EndTimeValueKey)) {
      _CreateEventViewTextEditingControllers[EndTimeValueKey]?.text =
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

    if (_CreateEventViewTextEditingControllers.containsKey(AddressValueKey)) {
      _CreateEventViewTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  set stateValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          StateValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(StateValueKey)) {
      _CreateEventViewTextEditingControllers[StateValueKey]?.text = value ?? '';
    }
  }

  set cityValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CityValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(CityValueKey)) {
      _CreateEventViewTextEditingControllers[CityValueKey]?.text = value ?? '';
    }
  }

  set numberOfGuestsValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          NumberOfGuestsValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(
        NumberOfGuestsValueKey)) {
      _CreateEventViewTextEditingControllers[NumberOfGuestsValueKey]?.text =
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

    if (_CreateEventViewTextEditingControllers.containsKey(NotesValueKey)) {
      _CreateEventViewTextEditingControllers[NotesValueKey]?.text = value ?? '';
    }
  }

  set priceValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PriceValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(PriceValueKey)) {
      _CreateEventViewTextEditingControllers[PriceValueKey]?.text = value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          EmailValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(EmailValueKey)) {
      _CreateEventViewTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PhoneValueKey: value,
        }),
    );

    if (_CreateEventViewTextEditingControllers.containsKey(PhoneValueKey)) {
      _CreateEventViewTextEditingControllers[PhoneValueKey]?.text = value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasDescription =>
      this.formValueMap.containsKey(DescriptionValueKey) &&
      (descriptionValue?.isNotEmpty ?? false);
  bool get hasDate =>
      this.formValueMap.containsKey(DateValueKey) &&
      (dateValue?.isNotEmpty ?? false);
  bool get hasStartTime =>
      this.formValueMap.containsKey(StartTimeValueKey) &&
      (startTimeValue?.isNotEmpty ?? false);
  bool get hasEndTime =>
      this.formValueMap.containsKey(EndTimeValueKey) &&
      (endTimeValue?.isNotEmpty ?? false);
  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);
  bool get hasState =>
      this.formValueMap.containsKey(StateValueKey) &&
      (stateValue?.isNotEmpty ?? false);
  bool get hasCity =>
      this.formValueMap.containsKey(CityValueKey) &&
      (cityValue?.isNotEmpty ?? false);
  bool get hasNumberOfGuests =>
      this.formValueMap.containsKey(NumberOfGuestsValueKey) &&
      (numberOfGuestsValue?.isNotEmpty ?? false);
  bool get hasNotes =>
      this.formValueMap.containsKey(NotesValueKey) &&
      (notesValue?.isNotEmpty ?? false);
  bool get hasPrice =>
      this.formValueMap.containsKey(PriceValueKey) &&
      (priceValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasDateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey]?.isNotEmpty ?? false;
  bool get hasStartTimeValidationMessage =>
      this.fieldsValidationMessages[StartTimeValueKey]?.isNotEmpty ?? false;
  bool get hasEndTimeValidationMessage =>
      this.fieldsValidationMessages[EndTimeValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;
  bool get hasStateValidationMessage =>
      this.fieldsValidationMessages[StateValueKey]?.isNotEmpty ?? false;
  bool get hasCityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey]?.isNotEmpty ?? false;
  bool get hasNumberOfGuestsValidationMessage =>
      this.fieldsValidationMessages[NumberOfGuestsValueKey]?.isNotEmpty ??
      false;
  bool get hasNotesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey]?.isNotEmpty ?? false;
  bool get hasPriceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get dateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey];
  String? get startTimeValidationMessage =>
      this.fieldsValidationMessages[StartTimeValueKey];
  String? get endTimeValidationMessage =>
      this.fieldsValidationMessages[EndTimeValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
  String? get stateValidationMessage =>
      this.fieldsValidationMessages[StateValueKey];
  String? get cityValidationMessage =>
      this.fieldsValidationMessages[CityValueKey];
  String? get numberOfGuestsValidationMessage =>
      this.fieldsValidationMessages[NumberOfGuestsValueKey];
  String? get notesValidationMessage =>
      this.fieldsValidationMessages[NotesValueKey];
  String? get priceValidationMessage =>
      this.fieldsValidationMessages[PriceValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
}

extension Methods on FormViewModel {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DateValueKey] = validationMessage;
  setStartTimeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StartTimeValueKey] = validationMessage;
  setEndTimeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EndTimeValueKey] = validationMessage;
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;
  setStateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StateValueKey] = validationMessage;
  setCityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CityValueKey] = validationMessage;
  setNumberOfGuestsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NumberOfGuestsValueKey] = validationMessage;
  setNotesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NotesValueKey] = validationMessage;
  setPriceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PriceValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    descriptionValue = '';
    dateValue = '';
    startTimeValue = '';
    endTimeValue = '';
    addressValue = '';
    stateValue = '';
    cityValue = '';
    numberOfGuestsValue = '';
    notesValue = '';
    priceValue = '';
    emailValue = '';
    phoneValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      DateValueKey: getValidationMessage(DateValueKey),
      StartTimeValueKey: getValidationMessage(StartTimeValueKey),
      EndTimeValueKey: getValidationMessage(EndTimeValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      StateValueKey: getValidationMessage(StateValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      NumberOfGuestsValueKey: getValidationMessage(NumberOfGuestsValueKey),
      NotesValueKey: getValidationMessage(NotesValueKey),
      PriceValueKey: getValidationMessage(PriceValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateEventViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateEventViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      DescriptionValueKey: getValidationMessage(DescriptionValueKey),
      DateValueKey: getValidationMessage(DateValueKey),
      StartTimeValueKey: getValidationMessage(StartTimeValueKey),
      EndTimeValueKey: getValidationMessage(EndTimeValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      StateValueKey: getValidationMessage(StateValueKey),
      CityValueKey: getValidationMessage(CityValueKey),
      NumberOfGuestsValueKey: getValidationMessage(NumberOfGuestsValueKey),
      NotesValueKey: getValidationMessage(NotesValueKey),
      PriceValueKey: getValidationMessage(PriceValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
    });
