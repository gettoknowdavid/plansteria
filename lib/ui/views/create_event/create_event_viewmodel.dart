import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
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
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _mediaService = locator<MediaService>();

  final _selectedDate = ReactiveValue<List<DateTime>>([
    DateTime.now(),
    DateTime.now().add(const Duration(hours: 1)),
  ]);
  List<DateTime> get selectedDate => _selectedDate.value;

  final ReactiveValue<File?> _image = ReactiveValue<File?>(null);
  File? get image => _image.value;

  final ReactiveValue<String?> _photoUrl = ReactiveValue<String?>(null);
  String? get photoUrl => _photoUrl.value;

  CreateEventViewModel() {
    listenToReactiveValues([_selectedDate, _image, _photoUrl]);
  }

  User get currentUser => _authService.currentUser!;

  bool get disabled =>
      !hasName ||
      !hasAddress ||
      !hasDate ||
      !hasStartTime ||
      !isFormValid ||
      isBusy;

  void getImage() async {
    final _pickedFile = await _mediaService.getImage(fromGallery: true);

    if (_pickedFile != null) {
      _image.value = File(_pickedFile.path);
    }

    notifyListeners();
  }

  Future<void> onEventCreate() async {
    setBusy(true);

    final uid = const Uuid().v4();

    final fileName = "$uid.jpg";

    if (_image.value != null) {
      final ref = _mediaService.storageRef.child("images/avatar/$fileName");

      await _mediaService.uploadFileToCloud(_image.value!.path, fileName, ref);

      _photoUrl.value = await _mediaService.getFileFromCloud(ref);
    }

    final event = Event(
      uid: uid,
      eventName: nameValue!,
      description: descriptionValue,
      eventAddress: addressValue!,
      notes: notesValue,
      price: priceValue == null ? null : double.tryParse(priceValue!),
      date: DateTime.parse(dateValue!),
      startTime: DateTime.parse(startTimeValue!),
      endTime: endTimeValue == null ? null : DateTime.parse(endTimeValue!),
      creatorId: currentUser.uid,
      eventImageUrl: _photoUrl.value,
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
        _navigationService.replaceWithNestedHomeViewInLayoutViewRouter(1);
        setBusy(false);
      },
    );
  }

  Future<List<DateTime>?> selectDateTime(BuildContext context) async {
    // Show the date picker and wait for a selected date
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );

    if (date == null) return null;

    // Show the time picker and wait for a selected time
    TimeOfDay? startTime = await showTimePicker(
      context: context,
      helpText: 'When is this event starting?',
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );

    if (startTime == null) return null;

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

      return [startDateTime, newEndDateTime];
    } else {
      _selectedDate.value = [startDateTime, endDateTime];

      return [startDateTime, endDateTime];
    }
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
