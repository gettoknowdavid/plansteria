import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:plansteria/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends FormViewModel {
  final _authService = locator<AuthService>();

  final _snackbarService = locator<SnackbarService>();

  final _navigationService = locator<NavigationService>();

  bool get disabled => isBusy || !isFormValid || !hasEmail;

  Future<void> submit({required String email}) async {
    _navigationService.navigateToConfirmationView();
    final result = await _authService.forgotPassword(email);

    setBusy(true);

    result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            invalidEmail: (_) => kInvalidEmailPassword,
          ),
        );
      },
      (success) {
        _navigationService.clearStackAndShow(Routes.confirmationView);
      },
    );
  }
}
