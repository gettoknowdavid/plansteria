import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/core/utils/currency_input_formatter.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/ui/common/app_constants.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/views/create_event/create_event_view.form.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/app_textfield.dart';
import 'package:plansteria/ui/widgets/create_event/create_event_image_widget.dart';
import 'package:plansteria/ui/widgets/date_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_event_viewmodel.dart';

@FormView(fields: [
  // Basic Information
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'description'),
  FormTextField(name: 'date', validator: Validators.validateDate),
  FormTextField(name: 'startTime', validator: Validators.validateDate),
  FormTextField(name: 'endTime'),

  // Location
  FormTextField(name: 'address', validator: Validators.validateAddress),
  FormTextField(name: 'state', validator: Validators.validateState),
  FormTextField(name: 'city', validator: Validators.validateCity),

  // Guests
  FormTextField(name: 'numberOfGuests'),
  FormTextField(name: 'notes'),

  // Pricing
  FormTextField(name: 'price'),

  // Contact
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'phone', validator: Validators.validatePhone),
])
class CreateEventView extends StackedView<CreateEventViewModel>
    with $CreateEventView {
  final bool editing;
  final Event? event;
  CreateEventView({super.key, this.editing = false, this.event});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final labelStyle = textTheme.titleSmall?.copyWith(
      color: textTheme.titleSmall?.color?.withOpacity(0.6),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.editing ? 'Edit' : 'Create Event'),
        leading: const BackButton(),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kGlobalPadding).r,
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Basic Information', style: labelStyle),
              5.verticalSpace,
              const CreateEventImageWidget(),
              10.verticalSpace,
              AppTextField(
                label: 'Name of Event',
                hint: 'Event Name',
                focusNode: nameFocusNode,
                controller: nameController,
                enabled: !viewModel.isBusy,
                validator: Validators.validateName,
              ),
              10.verticalSpace,
              AppTextField(
                label: 'Description',
                hint: 'What is your event about?',
                maxLines: 3,
                maxLength: 400,
                focusNode: descriptionFocusNode,
                controller: descriptionController,
                enabled: !viewModel.isBusy,
                prefixIcon: const Icon(PhosphorIcons.houseSimple),
              ),
              const DateSelector(),
              20.verticalSpace,
              Text('Location', style: labelStyle),
              5.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Address',
                      hint: 'Taking place at...',
                      focusNode: addressFocusNode,
                      controller: addressController,
                      enabled: !viewModel.isBusy,
                      validator: Validators.validateAddress,
                      prefixIcon: const Icon(PhosphorIcons.houseSimple),
                    ),
                  ),
                  10.horizontalSpace,
                  IconButton(
                    onPressed: viewModel.showMapBottomSheet,
                    color: theme.primaryColor,
                    style: IconButton.styleFrom(
                      backgroundColor: theme.inputDecorationTheme.fillColor,
                      padding: const EdgeInsets.all(14).r,
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ).r,
                        side: BorderSide(color: theme.primaryColor),
                      ),
                    ),
                    icon: const Icon(PhosphorIcons.mapPin),
                  ),
                ],
              ),
              10.verticalSpace,
              AppTextField(
                label: 'State',
                hint: 'Select State',
                focusNode: stateFocusNode,
                controller: stateController,
                enabled: !viewModel.isBusy,
                validator: Validators.validateState,
                prefixIcon: const Icon(PhosphorIcons.flag),
              ),
              10.verticalSpace,
              AppTextField(
                label: 'City',
                hint: 'Select city',
                focusNode: cityFocusNode,
                controller: cityController,
                enabled: !viewModel.isBusy,
                validator: Validators.validateCity,
                prefixIcon: const Icon(PhosphorIcons.buildings),
              ),
              20.verticalSpace,
              Text('Guests', style: labelStyle),
              5.verticalSpace,
              AppTextField(
                label: 'Number of Guests',
                hint: 'How many guests are you expecting?',
                focusNode: numberOfGuestsFocusNode,
                controller: numberOfGuestsController,
                keyboardType: TextInputType.number,
                enabled: !viewModel.isBusy,
                prefixIcon: const Icon(PhosphorIcons.hash),
              ),
              10.verticalSpace,
              AppTextField(
                label: 'Notes for guests',
                hint: 'Any notes?',
                focusNode: notesFocusNode,
                controller: notesController,
                enabled: !viewModel.isBusy,
                prefixIcon: const Icon(PhosphorIcons.note),
              ),
              20.verticalSpace,
              Text('Pricing', style: labelStyle),
              5.verticalSpace,
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
              20.verticalSpace,
              Text('Contact', style: labelStyle),
              5.verticalSpace,
              AppTextField(
                label: 'Email',
                hint: 'Your contact email address',
                focusNode: emailFocusNode,
                controller: emailController,
                enabled: !viewModel.isBusy,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(PhosphorIcons.at),
              ),
              10.verticalSpace,
              InternationalPhoneNumberInput(
                onInputChanged: null,
                onInputValidated: viewModel.setPhoneValidity,
                initialValue: PhoneNumber(isoCode: 'NG'),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  setSelectorButtonAsPrefixIcon: true,
                  leadingPadding: 16,
                  trailingSpace: false,
                ),
                hintText: "Contact phone number",
                inputDecoration: InputDecoration(
                  labelText: "Phone Number",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ).r,
                ),
                // validator: Validators.validatePhone,
                focusNode: phoneFocusNode,
                textFieldController: phoneController,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
              ),
              30.verticalSpace,
              AppButton(
                title: viewModel.editing ? 'Looks good' : 'Create',
                disabled: viewModel.editing ? false : viewModel.disabled,
                loading: viewModel.isBusy,
                onPressed: viewModel.editing
                    ? () => viewModel.onEditEvent(event!)
                    : () => viewModel.onEventCreate(),
              ),
              10.verticalSpace,
            ],
          ),
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
  void onViewModelReady(CreateEventViewModel viewModel) async {
    if (editing && event != null) {
      await viewModel.initialiseEdit(event!);
      nameController.text = event!.name;
      descriptionController.text = event?.description ?? '';
      addressController.text = event!.address;
      stateController.text = event!.state;
      cityController.text = event!.city;
      numberOfGuestsController.text = event?.numberOfGuests?.toString() ?? '';
      notesController.text = event?.notes ?? '';
      priceController.text = event?.price?.toString() ?? '';
      emailController.text = event!.email;
      phoneController.text = event!.phone;
    } else {
      final defaultStartDate = DateTime.now();
      final defaultEndDate = defaultStartDate.add(const Duration(hours: 2));
      dateController.text = defaultStartDate.toIso8601String();
      startTimeController.text = defaultStartDate.toIso8601String();
      endTimeController.text = defaultEndDate.toIso8601String();
    }

    await viewModel.initialise(
      dateController: dateController,
      endTimeController: endTimeController,
      startTimeController: startTimeController,
    );
    syncFormWithViewModel(viewModel);
  }

  @override
  CreateEventViewModel viewModelBuilder(context) => CreateEventViewModel();
}
