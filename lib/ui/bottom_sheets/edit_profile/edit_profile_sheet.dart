import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/bottom_sheets/app_bottom_sheet_wrapper.dart';
import 'package:plansteria/ui/bottom_sheets/edit_profile/edit_profile_sheet.form.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/app_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_profile_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'phone', validator: Validators.validatePhone),
  FormTextField(name: 'image'),
])
class EditProfileSheet extends StackedView<EditProfileSheetModel>
    with $EditProfileSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  EditProfileSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    return AppBottomSheetWrapper(
      child: Container(
        height: 1.sh,
        color: theme.scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                20.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Edit Profile',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: viewModel.close,
                      color: theme.colorScheme.primaryContainer,
                      icon: const Icon(PhosphorIcons.x),
                    ),
                  ],
                ),
                20.verticalSpace,
                20.verticalSpace,
                const _Avatar(),
                30.verticalSpace,
                AppTextField(
                  label: 'Name',
                  hint: 'Your Name',
                  focusNode: nameFocusNode,
                  controller: nameController,
                  enabled: !viewModel.isBusy,
                  validator: Validators.validateName,
                ),
                30.verticalSpace,
                AppTextField(
                  label: 'Phone Number',
                  hint: 'Your phone number',
                  focusNode: phoneFocusNode,
                  controller: phoneController,
                  enabled: !viewModel.isBusy,
                  validator: Validators.validatePhone,
                  keyboardType: TextInputType.number,
                  prefixText: '+234 ',
                  prefixIcon: const Icon(PhosphorIcons.phone),
                ),
                30.verticalSpace,
                AppButton(
                  onPressed: viewModel.updateProfile,
                  loading: viewModel.isBusy,
                  disabled: nameController.text.isEmpty,
                  title: 'Looks good',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(EditProfileSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(EditProfileSheetModel viewModel) {
    viewModel.init();
    nameController.text = viewModel.user.name;
    phoneController.text = viewModel.user.phone?.split("+234")[1] ?? '';
    syncFormWithViewModel(viewModel);
  }

  @override
  EditProfileSheetModel viewModelBuilder(context) => EditProfileSheetModel();
}

class _Avatar extends ViewModelWidget<EditProfileSheetModel> {
  const _Avatar();

  @override
  Widget build(BuildContext context, EditProfileSheetModel viewModel) {
    final theme = Theme.of(context);
    final outerRadius = 0.17.sw;
    final innerRadius = 0.165.sw;
    final iconSize = innerRadius * 0.6;

    return GestureDetector(
      onTap: viewModel.showImageSourceBottomSheet,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: outerRadius,
            backgroundColor: theme.colorScheme.onBackground,
            child: CircleAvatar(
              radius: innerRadius,
              foregroundImage:
                  viewModel.file == null && viewModel.user.avatar != null
                      ? NetworkImage(viewModel.user.avatar!)
                      : null,
              backgroundImage:
                  viewModel.file != null ? FileImage(viewModel.file!) : null,
              child: !viewModel.hasImage
                  ? Icon(PhosphorIcons.user, size: iconSize)
                  : null,
            ),
          ),
          Icon(PhosphorIcons.pen, size: iconSize),
        ],
      ),
    );
  }
}
