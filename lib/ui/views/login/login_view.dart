import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:plansteria/ui/widgets/auth_redirect_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_form_widget.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validateLoginPassword),
])
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            80.verticalSpace,
            Text(
              'Hello!',
              style: textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            10.verticalSpace,
            Text(
              "Welcome back, you've been missed.",
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            LoginFormWidget(),
           
            10.verticalSpace,
            AuthRedirectButton(
              text: "Don't have an account yet?",
              buttonLabel: 'Register now',
              onTap: viewModel.navigateToRegisterView,
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(context) => LoginViewModel();
}
