import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:plansteria/services/profile_service.dart';
import 'package:plansteria/ui/views/profile_stats/profile_stats_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ProfileViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _profileService = locator<ProfileService>();
  final _networkService = locator<NetworkService>();

  NetworkStatus get networkStatus => _networkService.status;
  User get user => _authService.currentUser!;

  Future<void> logout() async {
    setBusy(true);
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> showEditProfileBottomSheet() async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    }

    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.editProfile,
      isScrollControlled: true,
    );
  }

  ThemeMode? selectedThemeMode(BuildContext context) {
    return getThemeManager(context).selectedThemeMode;
  }

  Future<void> showThemeBottomSheet() async {
    await _bottomSheetService.showCustomSheet(variant: BottomSheetType.theme);
  }

  String getThemeModeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'Dark Mode';
      case ThemeMode.light:
        return 'Light Mode';
      default:
        return 'System';
    }
  }

  IconData getIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return PhosphorIcons.moon;
      case ThemeMode.light:
        return PhosphorIcons.sun;
      default:
        return PhosphorIcons.nut;
    }
  }

  Stream<int> get numberOfCreatedEvents =>
      _eventService.numberOfAllCreatedEvents(user.uid);

  Stream<int> get followers => _profileService.followers(user.uid);

  Stream<int> get following => _profileService.following(user.uid);

  Future<void> viewAllFollowers() async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    }

    return await _navigationService
        .navigateToNestedProfileStatsViewInLayoutViewRouter(
      type: StatsType.followers,
      routerId: 1,
    );
  }

  Future<void> viewAllFollowing() async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    }

    return await _navigationService
        .navigateToNestedProfileStatsViewInLayoutViewRouter(
      type: StatsType.following,
      routerId: 1,
    );
  }

  Future<void> viewAllEvents() async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    }

    return await _navigationService
        .navigateToNestedEventsViewInLayoutViewRouter(
      fromProfileView: true,
      routerId: 1,
    );
  }

  Future<void> navigateToAccountView() async {
    await _navigationService.navigateToNestedAccountViewInLayoutViewRouter(
      routerId: 1,
    );
  }

  Future<void> navigateToAboutView() async {
    await _navigationService.navigateToAboutView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _eventService,
        _networkService,
      ];

  @override
  Future<void> initialise() async {
    await _authService.getAuthUser();
  }
}
