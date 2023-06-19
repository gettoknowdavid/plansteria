import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/views/register/register_view.form.dart';
import 'package:plansteria/ui/views/register/register_viewmodel.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/app_textfield.dart';
import 'package:plansteria/ui/widgets/register/password_rules_widget.dart';
import 'package:stacked/stacked.dart';

class RegisterFormWidget extends StackedView<RegisterViewModel>
    with $RegisterView {
  RegisterFormWidget({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            hint: 'Your Name',
            label: 'Name',
            enabled: !viewModel.isBusy,
            focusNode: nameFocusNode,
            controller: nameController,
            validator: Validators.validateName,
          ),
          20.verticalSpace,
          AppTextField(
            hint: 'Your Email',
            label: 'Email',
            enabled: !viewModel.isBusy,
            focusNode: emailFocusNode,
            controller: emailController,
            validator: Validators.validateEmail,
          ),
          20.verticalSpace,
          AppTextField(
            hint: 'Your Password',
            label: 'Password',
            isPassword: true,
            enabled: !viewModel.isBusy,
            focusNode: passwordFocusNode,
            controller: passwordController,
            validator: Validators.validatePassword,
          ),
          10.verticalSpace,
          PasswordRulesWidget(),
          30.verticalSpace,
          AppButton(
            title: 'Register',
            disabled: viewModel.disabled,
            loading: viewModel.isBusy,
            onPressed: () async {
              await viewModel.register(
                name: nameController.text,
                email: emailController.text,
                password: passwordController.text,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void onDispose(RegisterViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
