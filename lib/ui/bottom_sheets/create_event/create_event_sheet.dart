import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/core/utils/currency_input_formater.dart';
import 'package:plansteria/ui/bottom_sheets/app_bottom_sheet_wrapper.dart';
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
  FormTextField(name: 'startTime'),
  FormTextField(name: 'endTime'),
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

    return AppBottomSheetWrapper(
      height: 0.7.sh,
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
              prefixIcon: const Icon(PhosphorIcons.houseSimple),
            ),
            12.verticalSpace,
            AppTextField(
              label: 'Notes for guests',
              hint: 'Any notes?',
              focusNode: notesFocusNode,
              controller: notesController,
              prefixIcon: const Icon(PhosphorIcons.note),
            ),
            12.verticalSpace,
            AppTextField(
              label: 'Price',
              hint: 'Set ticket price',
              focusNode: priceFocusNode,
              controller: priceController,
              // prefixText: '₦ ',
              keyboardType: TextInputType.number,
              inputFormatters: [CurrencyFormatter()],
              prefixIcon: const Icon(PhosphorIcons.currencyNgn),
            ),
            12.verticalSpace,
            DateSelector(),
            20.verticalSpace,
            AppButton(onPressed: viewModel.onEventCreate, title: 'Create'),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(CreateEventSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(CreateEventSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  CreateEventSheetModel viewModelBuilder(context) => CreateEventSheetModel();
}
