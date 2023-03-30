import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/views/register/register_form_widget.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
import 'package:plansteria/ui/widgets/auth_redirect_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validatePassword),
])
class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            30.verticalSpace,
            const Align(
              alignment: Alignment.centerLeft,
              child: AppBackButton(),
            ),
            50.verticalSpace,
            Text(
              'Register',
              style: textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            Text(
              "You're new here, register your new account.",
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            RegisterFormWidget(),
            10.verticalSpace,
            AuthRedirectButton(
              text: "Already have an account?",
              buttonLabel: 'Go back to Login',
              onTap: viewModel.navigateBackToLoginView,
            ),
          ],
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
