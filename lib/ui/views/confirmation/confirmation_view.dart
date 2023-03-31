import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'confirmation_viewmodel.dart';

class ConfirmationView extends StackedView<ConfirmationViewModel> {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'You have mail',
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium,
            ),
            10.verticalSpace,
            Text(
              "A password recovery mail has been sent to your email. Click on the link to reset your password.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            40.verticalSpace,
            AppButton(
              title: 'Back to Login',
              onPressed: viewModel.navigateBackToLoginView,
            ),
            120.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  ConfirmationViewModel viewModelBuilder(context) => ConfirmationViewModel();
}
