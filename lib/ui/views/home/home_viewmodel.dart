import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  Future<void> logout() async {
    _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Network Error',
      description: kNoNetworkConnectionError,
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
