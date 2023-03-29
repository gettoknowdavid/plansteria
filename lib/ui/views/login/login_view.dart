import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/common/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validateLoginPassword),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Form(
          child: Column(),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(context) => LoginViewModel();
}
