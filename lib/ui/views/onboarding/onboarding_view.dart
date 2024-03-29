import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final colorScheme = Theme.of(context).colorScheme;

    return IntroductionScreen(
      key: viewModel.key,
      showDoneButton: true,
      showSkipButton: false,
      showNextButton: true,
      showBackButton: true,
      isProgress: false,
      animationDuration: 250,
      rawPages: viewModel.pages,
      controlsMargin: const EdgeInsets.only(bottom: 30).r,
      back: Icon(Icons.chevron_left, size: 26.r),
      next: Icon(Icons.chevron_right, size: 26.r),
      done: const Text('Get Started'),
      nextFlex: 0,
      skipOrBackFlex: 0,
      onDone: viewModel.onDone,
      doneStyle: FilledButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(context) => OnboardingViewModel();
}
