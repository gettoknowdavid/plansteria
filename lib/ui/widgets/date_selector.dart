import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/views/create_event/create_event_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DateSelector extends ViewModelWidget<CreateEventViewModel> {
  const DateSelector({super.key});

  @override
  Widget build(context, viewModel) {
    final theme = Theme.of(context);

    final formattedDate = DateFormat.yMMMEd().format(viewModel.selectedDate[0]);
    final formattedTime = viewModel.timeFormatter(viewModel.selectedDate);

    return InkWell(
      onTap: () async => await viewModel.selectDateTime(context),
      child: SizedBox(
        height: 70,
        width: 1.sw,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12).r,
              decoration: BoxDecoration(
                color: theme.inputDecorationTheme.focusColor,
                borderRadius: const BorderRadius.all(Radius.circular(14)).r,
              ),
              child: Icon(
                PhosphorIcons.calendar,
                color: theme.colorScheme.primaryContainer.withOpacity(0.6),
              ),
            ),
            16.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  formattedTime,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
