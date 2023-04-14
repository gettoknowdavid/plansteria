import 'package:intl/intl.dart';

String eventDetailsTimeFormatter(DateTime startTime, [DateTime? endTime]) {
    final DateFormat formatter = DateFormat('h:mm a');

    final String startTimeString = formatter.format(startTime);
    if (endTime != null) {
      final String endTimeString = formatter.format(endTime!);
      return '$startTimeString to $endTimeString';
    } else {
      return startTimeString;
    }
  }