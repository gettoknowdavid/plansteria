import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/media_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:plansteria/ui/views/create_event/create_event_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class CreateEventViewModel extends FormViewModel with ListenableServiceMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _mediaService = locator<MediaService>();

  final _selectedDate = ReactiveValue<List<DateTime>>([
    DateTime.now(),
    DateTime.now().add(const Duration(hours: 1)),
  ]);

  final _editing = ReactiveValue<bool>(false);
  final _images = ReactiveValue<List<File>?>(null);
  final _photoUrl = ReactiveValue<String?>(null);
  final _photoUrls = ReactiveValue<List<String?>>([]);
  final _currentIndex = ReactiveValue<int>(0);
  final _isPhoneValid = ReactiveValue<bool>(false);

  CreateEventViewModel() {
    listenToReactiveValues([
      _selectedDate,
      _images,
      _photoUrl,
      _photoUrls,
      _currentIndex,
      _editing,
      _isPhoneValid,
    ]);
  }

  int get currentIndex => _currentIndex.value;
  bool get editing => _editing.value;

  User get currentUser => _authService.currentUser!;

  bool get disabled =>
      !hasName ||
      !hasAddress ||
      !hasDate ||
      !hasStartTime ||
      !isFormValid ||
      !_isPhoneValid.value ||
      isBusy;

  List<File>? get images => _images.value;

  String? get photoUrl => _photoUrl.value;

  List<String?> get photoUrls => _photoUrls.value;

  List<DateTime> get selectedDate => _selectedDate.value;

  late TextEditingController _dateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;

  void getImages() async {
    final _pickedFiles = await _mediaService.getMultiImages();

    if (_pickedFiles != null || _pickedFiles?.isNotEmpty == true) {
      _images.value = _pickedFiles!.map((e) => File(e.path)).toList();
    }

    notifyListeners();
  }

  void setPhoneValidity(bool value) {
    _isPhoneValid.value = value;
    notifyListeners();
  }

  Future<void> onEditEvent(Event e) async {
    setBusy(true);

    if (_images.value != null) {
      for (var i = 0; i < _images.value!.length; i++) {
        final fileName = "${e.uid}+$i.jpg";

        final ref = _mediaService.storageRef.child("images/avatar/$fileName");

        await _mediaService.uploadFileToCloud(
            _images.value![i].path, fileName, ref);

        final url = await _mediaService.getFileFromCloud(ref);
        _photoUrls.value.add(url);
      }
    }

    final updatedEvent = e.copyWith(
      name: nameValue ?? e.name,
      description: descriptionValue ?? e.description,
      address: addressValue ?? e.address,
      state: stateValue ?? e.state,
      city: cityValue ?? e.city,
      notes: notesValue ?? e.notes,
      price: priceValue == null ? e.price : double.tryParse(priceValue!),
      date: dateValue == null || dateValue == ''
          ? e.date
          : DateTime.parse(dateValue!),
      startTime: startTimeValue == null || startTimeValue == ''
          ? e.startTime
          : DateTime.parse(startTimeValue!),
      endTime: endTimeValue == null || endTimeValue == ''
          ? e.endTime
          : DateTime.parse(endTimeValue!),
      eventImageUrl: _photoUrl.value,
      email: emailValue ?? e.email,
      phone: phoneValue ?? e.phone,
      photoUrls: _photoUrls.value.isEmpty ? e.photoUrls : _photoUrls.value,
    );

    final result = await _eventService.createEvent(updatedEvent);

    result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            networkError: (_) => kNoNetworkConnectionError,
          ),
        );
      },
      (success) {
        _navigationService.popRepeated(1);
        setBusy(false);
      },
    );
    notifyListeners();
  }

  Future<void> onEventCreate() async {
    setBusy(true);

    final uid = const Uuid().v4();

    if (_images.value != null) {
      for (var i = 0; i < _images.value!.length; i++) {
        final fileName = "$uid+$i.jpg";

        final ref = _mediaService.storageRef.child("images/avatar/$fileName");

        await _mediaService.uploadFileToCloud(
            _images.value![i].path, fileName, ref);

        final url = await _mediaService.getFileFromCloud(ref);
        _photoUrls.value.add(url);
      }
    }

    final event = Event(
      uid: uid,
      name: nameValue!,
      description: descriptionValue,
      address: addressValue!,
      state: stateValue!,
      city: cityValue!,
      notes: notesValue,
      price: priceValue == null ? null : double.tryParse(priceValue!),
      date: DateTime.parse(dateValue!),
      startTime: DateTime.parse(startTimeValue!),
      endTime: endTimeValue == null ? null : DateTime.parse(endTimeValue!),
      eventImageUrl: _photoUrl.value,
      numberOfGuests:
          numberOfGuestsValue == null || numberOfGuestsValue!.isEmpty
              ? null
              : int.parse(numberOfGuestsValue!),
      email: emailValue!,
      phone: phoneValue!,
      photoUrls: _photoUrls.value,
      creatorId: currentUser.uid,
    );

    final result = await _eventService.createEvent(event);

    result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            networkError: (_) => kNoNetworkConnectionError,
          ),
        );
      },
      (success) {
        _navigationService.back();
        setBusy(false);
      },
    );
  }

  Future<void> selectDateTime(BuildContext context) async {
    // Show the date picker and wait for a selected date
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );

    if (date == null) return;

    // Show the time picker and wait for a selected time
    TimeOfDay? startTime = await showTimePicker(
      context: context,
      helpText: 'When is this event starting?',
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );

    if (startTime == null) return;

    // Show the end time picker and wait for a selected time
    TimeOfDay? endTime = await showTimePicker(
      context: context,
      helpText: 'When will this event end?',
      initialTime: const TimeOfDay(hour: 10, minute: 0),
    );

    endTime ??= TimeOfDay(hour: startTime.hour + 2, minute: 0);

    final DateTime startDateTime = date.copyWith(
      hour: startTime.hour,
      minute: startTime.minute,
    );

    DateTime endDateTime = date.copyWith(
      hour: endTime.hour,
      minute: endTime.minute,
    );

    if (endDateTime.isBefore(startDateTime)) {
      TimeOfDay? newEndTime = await showTimePicker(
        context: context,
        helpText: 'End time should be after start time',
        initialTime: const TimeOfDay(hour: 10, minute: 0),
      );

      DateTime newEndDateTime = date.copyWith(
        hour: newEndTime!.hour,
        minute: newEndTime.minute,
      );

      _selectedDate.value = [startDateTime, newEndDateTime];
    } else {
      _selectedDate.value = [startDateTime, endDateTime];
    }

    _dateController.text = selectedDate[0].toIso8601String();
    _startTimeController.text = selectedDate[0].toIso8601String();
    _endTimeController.text = selectedDate[1].toIso8601String();
  }

  void setPhotoIndex(int index) {
    _currentIndex.value = index;
  }

  Future<void> showMapBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.map,
      isScrollControlled: true,
      barrierDismissible: false,
    );
  }

  Future<void> initialiseEdit(Event e) async {
    _editing.value = true;
    _photoUrls.value = e.photoUrls;

    _selectedDate.value = [e.startTime, e.endTime!];
  }

  Future<void> initialise({
    required TextEditingController dateController,
    required TextEditingController startTimeController,
    required TextEditingController endTimeController,
  }) async {
    _dateController = dateController;
    _startTimeController = startTimeController;
    _endTimeController = endTimeController;
  }

  String timeFormatter(List<DateTime>? selectedDate) {
    final DateFormat formatter = DateFormat('hh:mm a');
    if (selectedDate != null) {
      final String startTime = formatter.format(selectedDate[0]);
      final String endTime = formatter.format(selectedDate[1]);
      return '$startTime to $endTime';
    } else {
      return 'Time not selected';
    }
  }
}
