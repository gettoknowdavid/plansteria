import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future<void> logout() async {
    setBusy(true);
    await _authService.logout().then((_) {
      setBusy(false);
      _navigationService.clearStackAndShow(Routes.loginView);
    });
  }
}
