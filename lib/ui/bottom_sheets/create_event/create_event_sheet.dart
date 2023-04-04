import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/widgets/app_bottom_sheet_handle.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/app_textfield.dart';
import 'package:plansteria/ui/widgets/date_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'create_event_sheet.form.dart';
import 'create_event_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'address', validator: Validators.validateName),
  FormTextField(name: 'notes'),
  FormTextField(name: 'price'),
  FormTextField(name: 'date'),
])
class CreateEventSheet extends StackedView<CreateEventSheetModel>
    with $CreateEventSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  CreateEventSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Container(
      height: 0.7.sh,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppBottomSheetHandle(),
            20.verticalSpace,
            Text(
              request.title ?? 'Hello Stacked Sheet!!',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge,
            ),
            20.verticalSpace,
            AppTextField(
              label: 'Name of Event',
              hint: 'Event Name',
              focusNode: nameFocusNode,
              controller: nameController,
              validator: Validators.validateName,
            ),
            12.verticalSpace,
            AppTextField(
              label: 'Address',
              hint: 'Taking place at...',
              focusNode: addressFocusNode,
              controller: addressController,
              validator: Validators.validateName,
            ),
            12.verticalSpace,
            AppTextField(
              label: 'Notes for guests',
              hint: 'Any notes?',
              focusNode: notesFocusNode,
              controller: notesController,
            ),
            12.verticalSpace,
            AppTextField(
              label: 'Price',
              hint: 'Set ticket price',
              focusNode: priceFocusNode,
              controller: priceController,
            ),
            12.verticalSpace,
            const DateSelector(),
            20.verticalSpace,
            AppButton(onPressed: () {}, title: 'Create'),
          ],
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  CreateEventSheetModel viewModelBuilder(context) => CreateEventSheetModel();
}
