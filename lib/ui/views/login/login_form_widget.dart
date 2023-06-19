import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:plansteria/ui/widgets/app_textfield.dart';
import 'package:stacked/stacked.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

class LoginFormWidget extends StackedView<LoginViewModel> with $LoginView {
  LoginFormWidget({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            hint: 'Your Email',
            label: 'Email',
            enabled: !viewModel.isBusy,
            focusNode: emailFocusNode,
            controller: emailController,
            validator: Validators.validateEmail,
          ),
          26.verticalSpace,
          AppTextField(
            hint: 'Your Password',
            label: 'Password',
            isPassword: true,
            enabled: !viewModel.isBusy,
            focusNode: passwordFocusNode,
            controller: passwordController,
            validator: Validators.validateLoginPassword,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: viewModel.navigateToForgotPasswordView,
              child: const Text('Forgot Password'),
            ),
          ),
          30.verticalSpace,
          AppButton(
            title: 'Login',
            disabled: viewModel.disabled,
            loading: viewModel.isBusy,
            onPressed: () async {
              await viewModel.login(
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
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(context) => LoginViewModel();
}
