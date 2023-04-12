import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/bottom_sheets/create_event/create_event_sheet.form.dart';
import 'package:plansteria/ui/bottom_sheets/create_event/create_event_sheet_model.dart';
import 'package:stacked/stacked.dart';

class DateSelector extends StackedView<CreateEventSheetModel>
    with $CreateEventSheet {
  DateSelector({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    final formattedDate = DateFormat.yMMMEd().format(viewModel.selectedDate[0]);
    final formattedTime = viewModel.timeFormatter(viewModel.selectedDate);

    return InkWell(
      onTap: () async {
        await viewModel.selectDateTime(context);
        final selectedDate = viewModel.selectedDate;
        dateController.text = selectedDate[0].toIso8601String();
        startTimeController.text = selectedDate[0].toIso8601String();
        endTimeController.text = selectedDate[1].toIso8601String();
      },
      child: SizedBox(
        height: 70,
        width: 1.sw,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12).r,
              decoration: BoxDecoration(
                color: theme.inputDecorationTheme.fillColor,
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

  @override
  CreateEventSheetModel viewModelBuilder(BuildContext context) {
    return CreateEventSheetModel();
  }
}
