import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/services/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _chatService = locator<ChatService>();
  final _locationService = locator<LocationService>();
  final _navigationService = locator<NavigationService>();
  final _preferences = locator<SharedPreferencesService>();

  bool get isAuthenticated => _authService.isAuthenticated;
  bool? get isEmailVerified => _authService.isEmailVerified;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    await _authService.checkAuthenticated();
    await _authService.checkEmailVerified();
    FlutterNativeSplash.remove();

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    if (_preferences.isInitialStartup) {
      _navigationService.clearStackAndShow(Routes.onboardingView);
    } else {
      if (!isAuthenticated) {
        _navigationService.clearStackAndShow(Routes.loginView);
      }

      if (isAuthenticated && isEmailVerified == false) {
        _navigationService.clearStackAndShow(Routes.verificationView);
      }

      if (isAuthenticated && isEmailVerified == true) {
        await _chatService.loadChatHistory();
        await Geolocator.checkPermission();
        await _locationService.determinePosition();

        _navigationService.clearStackAndShow(Routes.layoutView);
      }
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
