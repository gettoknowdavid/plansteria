import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/bottom_sheets/create_event/create_event_sheet.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateEventSheetModel extends FormViewModel with ListenableServiceMixin {
  CreateEventSheetModel() {
    listenToReactiveValues([_selectedDate]);
  }

  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();

  Future<void> onEventCreate() async {
    print(nameValue);
    print(addressValue);
    print(notesValue);
    print(priceValue);
    print(dateValue);
    print(startTimeValue);
    print(endTimeValue);
  }

  final _selectedDate = ReactiveValue<List<DateTime>>(
      [DateTime.now(), DateTime.now().add(const Duration(hours: 1))]);
  List<DateTime> get selectedDate => _selectedDate.value;

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
