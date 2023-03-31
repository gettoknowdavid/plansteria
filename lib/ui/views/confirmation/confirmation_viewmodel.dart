import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConfirmationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBackToLoginView() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
