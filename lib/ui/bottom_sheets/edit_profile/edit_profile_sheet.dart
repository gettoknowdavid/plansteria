import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
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
    return Container(
      height: 1.sh,
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (30).verticalSpace,
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
              20.verticalSpace,
              AppTextField(
                label: 'Name of Event',
                hint: 'Event Name',
                focusNode: nameFocusNode,
                controller: nameController,
                enabled: !viewModel.isBusy,
                validator: Validators.validateName,
              ),
              30.verticalSpace,
              AppButton(
                onPressed: () {},
                loading: viewModel.isBusy,
                disabled: viewModel.disabled,
                title: 'Save',
              ),
            ],
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
    nameController.text = viewModel.user!.name;
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
    final outerRadius = 0.15.sw;
    final innerRadius = 0.145.sw;
    final iconSize = innerRadius * 0.6;

    final iconColor = theme.colorScheme.onPrimary;

    return GestureDetector(
      onTap: viewModel.showImageSourceBottomSheet,
      child: CircleAvatar(
        radius: outerRadius,
        backgroundColor: theme.colorScheme.onBackground,
        child: CircleAvatar(
          radius: innerRadius,
          foregroundImage: viewModel.user?.avatar != null
              ? NetworkImage(viewModel.user!.avatar!)
              : null,
          child: viewModel.user?.avatar == null
              ? Icon(PhosphorIcons.user, size: iconSize, color: iconColor)
              : null,
        ),
      ),
    );
  }
}
