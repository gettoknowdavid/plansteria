import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:plansteria/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  bool get disabled =>
      !isFormValid || !hasName || !hasEmail || !hasPassword || isBusy;

  final _authService = locator<AuthService>();

  final _dialogService = locator<DialogService>();

  final _networkService = locator<NetworkService>();

  final _snackbarService = locator<SnackbarService>();

  final _navigationService = locator<NavigationService>();

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {}

  void navigateBackToLoginView() => _navigationService.navigateToLoginView();
  void navigateBack() => _navigationService.popRepeated(1);
}
