import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/core/utils/currency_input_formater.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/views/create_event/create_event_view.form.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/app_textfield.dart';
import 'package:plansteria/ui/widgets/date_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_event_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'description'),
  FormTextField(name: 'address', validator: Validators.validateName),
  FormTextField(name: 'notes'),
  FormTextField(name: 'price'),
  FormTextField(name: 'date', validator: Validators.validateDate),
  FormTextField(name: 'startTime', validator: Validators.validateDate),
  FormTextField(name: 'endTime'),
])
class CreateEventView extends StackedView<CreateEventViewModel>
    with $CreateEventView {
  CreateEventView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kGlobalPadding).r,
        child: Column(
          children: [
            const _ImageWidget(),
            30.verticalSpace,
            AppTextField(
              label: 'Name of Event',
              hint: 'Event Name',
              focusNode: nameFocusNode,
              controller: nameController,
              enabled: !viewModel.isBusy,
              validator: Validators.validateName,
            ),
            20.verticalSpace,
            AppTextField(
              label: 'Description',
              hint: 'What is your event about?',
              maxLines: 3,
              maxLength: 200,
              focusNode: descriptionFocusNode,
              controller: descriptionController,
              enabled: !viewModel.isBusy,
              prefixIcon: const Icon(PhosphorIcons.houseSimple),
            ),
            20.verticalSpace,
            AppTextField(
              label: 'Address',
              hint: 'Taking place at...',
              focusNode: addressFocusNode,
              controller: addressController,
              enabled: !viewModel.isBusy,
              validator: Validators.validateName,
              prefixIcon: const Icon(PhosphorIcons.houseSimple),
            ),
            20.verticalSpace,
            AppTextField(
              label: 'Notes for guests',
              hint: 'Any notes?',
              focusNode: notesFocusNode,
              controller: notesController,
              enabled: !viewModel.isBusy,
              prefixIcon: const Icon(PhosphorIcons.note),
            ),
            20.verticalSpace,
            AppTextField(
              label: 'Price',
              hint: 'Set ticket price',
              focusNode: priceFocusNode,
              controller: priceController,
              enabled: !viewModel.isBusy,
              keyboardType: TextInputType.number,
              inputFormatters: [CurrencyFormatter()],
              prefixIcon: const Icon(PhosphorIcons.currencyNgn),
            ),
            12.verticalSpace,
            DateSelector(),
            20.verticalSpace,
            AppButton(
              onPressed: viewModel.onEventCreate,
              disabled: viewModel.disabled,
              loading: viewModel.isBusy,
              title: 'Create',
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(CreateEventViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(CreateEventViewModel viewModel) {
    final defaultStartDate = DateTime.now();
    final defaultEndDate = defaultStartDate.add(const Duration(hours: 2));
    dateController.text = defaultStartDate.toIso8601String();
    startTimeController.text = defaultStartDate.toIso8601String();
    endTimeController.text = defaultEndDate.toIso8601String();
    syncFormWithViewModel(viewModel);
  }

  @override
  CreateEventViewModel viewModelBuilder(context) => CreateEventViewModel();
}

class _ImageWidget extends ViewModelWidget<CreateEventViewModel> {
  const _ImageWidget();

  @override
  Widget build(BuildContext context, CreateEventViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final padding = const EdgeInsets.fromLTRB(10, 8, 10, 8).r;
    final borderRadius = const BorderRadius.all(Radius.circular(20)).r;

    return InkWell(
      onTap: viewModel.getImage,
      child: Container(
        height: 0.26.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.15),
          borderRadius: borderRadius,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                image: viewModel.image != null
                    ? DecorationImage(
                        image: FileImage(viewModel.image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: padding,
                margin: const EdgeInsets.all(kGlobalPadding).r,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(10)).r,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      PhosphorIcons.camera,
                      size: 18.sp,
                      color: theme.colorScheme.onPrimary,
                    ),
                    6.horizontalSpace,
                    Text(
                      viewModel.image != null ? 'Change Image' : 'Select Image',
                      style: textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
