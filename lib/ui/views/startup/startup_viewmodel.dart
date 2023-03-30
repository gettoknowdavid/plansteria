import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends ReactiveViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  bool get isAuthenticated => _authService.isAuthenticated;

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    await _authService.checkAuthenticated();
    FlutterNativeSplash.remove();

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    if (!isAuthenticated) {
      _navigationService.replaceWithLoginView();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
