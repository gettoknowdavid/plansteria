import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/services/shared_preferences_service.dart';
import 'package:plansteria/ui/common/app_keys.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:plansteria/ui/widgets/onboarding/onboarding_page_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const _rawPages = [
  OnboardingPageModel(
    title: 'Create an Event',
    body: 'Easily create and publish your events.',
    asset: kOnboardingAsset1,
  ),
  OnboardingPageModel(
    title: 'Manage your Events',
    body: 'Constantly manage your events in real time with ease.',
    asset: kOnboardingAsset2,
  ),
  OnboardingPageModel(
    title: 'Talk to ChatGPT',
    body: 'Get creative with OpenAI powered AI chat - ChatGPT.',
    asset: kOnboardingAsset3,
  ),
];

final _introKey = GlobalKey<IntroductionScreenState>();

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();

  GlobalKey<IntroductionScreenState> get key => _introKey;

  List<OnboardingPageModel> get pages => _rawPages;

  Future<void> onDone() async {
    _preferences.write(key: kInitKey, value: 1);
    await _navigationService.replaceWithLoginView();
  }
}
