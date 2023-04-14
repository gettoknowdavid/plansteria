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
  FormTextField(name: 'description'),
  FormTextField(name: 'address', validator: Validators.validateName),
  FormTextField(name: 'notes'),
  FormTextField(name: 'price'),
  FormTextField(name: 'date', validator: Validators.validateDate),
  FormTextField(name: 'startTime', validator: Validators.validateDate),
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
      height: 0.85.sh,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppBottomSheetHandle(),
              20.verticalSpace,
              Text(
                'Create Event',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
              20.verticalSpace,
              AppTextField(
                label: 'Name of Event',
                hint: 'Event Name',
                focusNode: nameFocusNode,
                controller: nameController,
                enabled: !viewModel.isBusy,
                validator: Validators.validateName,
              ),
              12.verticalSpace,
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
              12.verticalSpace,
              AppTextField(
                label: 'Address',
                hint: 'Taking place at...',
                focusNode: addressFocusNode,
                controller: addressController,
                enabled: !viewModel.isBusy,
                validator: Validators.validateName,
                prefixIcon: const Icon(PhosphorIcons.houseSimple),
              ),
              12.verticalSpace,
              AppTextField(
                label: 'Notes for guests',
                hint: 'Any notes?',
                focusNode: notesFocusNode,
                controller: notesController,
                enabled: !viewModel.isBusy,
                prefixIcon: const Icon(PhosphorIcons.note),
              ),
              12.verticalSpace,
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
                onPressed: () => viewModel.onEventCreate(SheetResponse()),
                disabled: viewModel.disabled,
                loading: viewModel.isBusy,
                title: 'Create',
              ),
            ],
          ),
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
    final defaultStartDate = DateTime.now();
    final defaultEndDate = defaultStartDate.add(const Duration(hours: 2));
    dateController.text = defaultStartDate.toIso8601String();
    startTimeController.text = defaultStartDate.toIso8601String();
    endTimeController.text = defaultEndDate.toIso8601String();
    syncFormWithViewModel(viewModel);
  }

  @override
  CreateEventSheetModel viewModelBuilder(context) => CreateEventSheetModel();
}

//  Container(
//                 decoration = BoxDecoration(
//                   color: theme.colorScheme.background,
//                   borderRadius: const BorderRadius.all(Radius.circular(12)),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.grey,
//                       blurRadius: 4,
//                       spreadRadius: 0,
//                       offset: Offset(0, 4),
//                     )
//                   ],
//                 ),
//                 child = DropdownButtonFormField<String?>(
//                   items: const [
//                     DropdownMenuItem(child: Text('cars')),
//                   ],
//                   elevation: 20,
//                   onChanged: (v) {},
//                   decoration: const InputDecoration(
//                     // labelText: 'Customer',
//                     hintText: 'Select something',
//                     label: Padding(
//                       padding: EdgeInsets.only(top: 30.0),
//                       child: Text('Customer'),
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.all(Radius.circular(12)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.all(Radius.circular(12)),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.all(Radius.circular(12)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                       borderRadius: BorderRadius.all(Radius.circular(12)),
//                     ),
//                   ),
//                 ),
//               ),
