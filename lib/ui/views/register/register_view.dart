import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/views/register/register_form_widget.dart';
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
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            30.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: viewModel.navigateBack,
                child: Container(
                  padding: EdgeInsets.zero,
                  width: 50.r,
                  height: 44.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme.background,
                    border: Border.all(
                      color: colorScheme.onBackground.withOpacity(0.3),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)).r,
                  ),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? Icon(Icons.chevron_left, size: 32.r)
                      : Icon(Icons.arrow_back, size: 32.r),
                ),
              ),
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
