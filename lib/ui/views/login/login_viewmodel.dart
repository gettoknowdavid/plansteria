import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:plansteria/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();

  final _dialogService = locator<DialogService>();

  final _networkService = locator<NetworkService>();

  final _snackbarService = locator<SnackbarService>();

  final _navigationService = locator<NavigationService>();

  bool get disabled => !isFormValid || !hasEmail || !hasPassword || isBusy;

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  NetworkStatus get networkStatus => _networkService.status;

  Future<void> login({required String email, required String password}) async {
    if (networkStatus == NetworkStatus.disconnected) {
      _dialogService.showCustomDialog(variant: DialogType.networkError);
    } else {
      setBusy(true);
      final result = await _authService.login(email: email, password: password);
      return result.fold(
        (failure) {
          setBusy(false);
          _snackbarService.showCustomSnackBar(
            duration: const Duration(seconds: 6),
            variant: SnackbarType.error,
            message: failure.maybeMap(
              orElse: () => '',
              serverError: (_) => kServerErrorMessage,
              invalidEmailOrPassword: (_) => kInvalidEmailPassword,
            ),
          );
        },
        (success) => _navigationService.clearStackAndShow(Routes.homeView),
      );
    }
  }

  void navigateToForgotPasswordView() =>
      _navigationService.navigateToForgotPasswordView();

  void navigateToRegisterView() => _navigationService.navigateToRegisterView();
}
