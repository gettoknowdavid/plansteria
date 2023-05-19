import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return IntroductionScreen(
      key: viewModel.key,
      showDoneButton: true,
      showSkipButton: true,
      showNextButton: true,
      isProgress: false,
      animationDuration: 250,
      rawPages: viewModel.pages,
      controlsMargin: const EdgeInsets.only(bottom: 30).r,
      next: Icon(Icons.chevron_right, size: 26.r),
      done: const Text('GET STARTED'),
      skip: const Text('SKIP'),
      nextFlex: 0,
      skipOrBackFlex: 0,
      onDone: viewModel.onDone,
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(context) => OnboardingViewModel();
}
