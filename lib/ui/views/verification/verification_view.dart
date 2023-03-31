import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'verification_viewmodel.dart';

class VerificationView extends StackedView<VerificationViewModel> {
  const VerificationView({super.key});

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
              'Verification',
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium,
            ),
            10.verticalSpace,
            Text(
              'Open your mail application to check for the verification mail we just sent to you.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            20.verticalSpace,
            AppButton(
              title: 'Open mail app',
              onPressed: viewModel.openMailApp,
            ),
            20.verticalSpace,
            OutlinedButton(
              onPressed: viewModel.checkEmailVerified,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: theme.colorScheme.primary),
                fixedSize: Size(1.sw, 53),
              ),
              child: const Text('Verify'),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: viewModel.sendVerification,
                  child: const Text('Resend'),
                ),
                TextButton(
                  onPressed: viewModel.cancel,
                  child: const Text('Cancel'),
                )
              ],
            ),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  VerificationViewModel viewModelBuilder(context) => VerificationViewModel();
}
