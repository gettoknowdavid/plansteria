import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'account_view.form.dart';

class AccountViewModel extends FormViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  AccountViewModel() {
    listenToReactiveValues([_showEmail, _showPassword]);
  }

  User get currentUser => _authService.currentUser!;

  final _showEmail = ReactiveValue<bool>(false);
  bool get showEmail => _showEmail.value;

  final _showPassword = ReactiveValue<bool>(false);
  bool get showPassword => _showPassword.value;

  bool get emailFieldDisabled => !hasEmail || emailValue == currentUser.email;

  bool get passwordButtonDisabled =>
      !hasPassword ||
      !hasConfirmPassword ||
      hasPasswordValidationMessage ||
      passwordValue != confirmPasswordValue;

  void onEmailExpansionChanged(bool value) => _showEmail.value = value;
  void onPasswordExpansionChanged(bool value) => _showPassword.value = value;

  Future<void> updateEmail() async {
    setBusy(true);

    if (hasEmail && isFormValid) {
      final result = await _authService.updateEmailAddress(emailValue!);
      return result.fold(
        (failure) {
          setBusy(false);
          _snackbarService.showCustomSnackBar(
            duration: const Duration(seconds: 6),
            variant: SnackbarType.error,
            message: failure.maybeMap(
              orElse: () => '',
              error: (value) => value.message ?? '',
              requiresRecentLogin: (_) => kRequiresRecentLoginErrorMessage,
              serverError: (_) => kServerErrorMessage,
              invalidEmail: (_) => kInvalidEmail,
              emailInUse: (_) => kEmailAlreadyInUseErrorMessage,
            ),
          );
        },
        (success) async {
          setBusy(false);
          await showConfirmationDialog();
        },
      );
    }
  }

  Future<void> logout() async {
    setBusy(true);
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> showConfirmationDialog() async => await _dialogService
      .showDialog(
        barrierDismissible: false,
        title: 'Email Updated',
        description:
            "Your email has been updated to $emailValue. \n\nYou will have to login with your password and new email.",
        buttonTitle: 'Okay, great!',
      )
      .whenComplete(logout);

  Future<void> updatePassword() async {
    final confirmationResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.passwordConfirmation,
      isScrollControlled: true,
      enableDrag: false,
    );
    if (confirmationResponse?.confirmed == true) {
      setBusy(true);
      final result = await _authService.updatePassword(passwordValue!);
      return result.fold(
        (failure) {
          setBusy(false);
          _snackbarService.showCustomSnackBar(
            duration: const Duration(seconds: 6),
            variant: SnackbarType.error,
            message: failure.maybeMap(
              orElse: () => '',
              error: (value) => value.message ?? '',
              requiresRecentLogin: (_) => kRequiresRecentLoginErrorMessage,
              serverError: (_) => kServerErrorMessage,
              invalidEmail: (_) => kInvalidEmail,
              emailInUse: (_) => kEmailAlreadyInUseErrorMessage,
            ),
          );
        },
        (success) async {
          setBusy(false);
          await _dialogService
              .showDialog(
                barrierDismissible: false,
                title: 'Password Updated',
                description:
                    "Your password has been updated. \n\nYou will have to login with your email and your new password.",
                buttonTitle: 'Okay, great!',
              )
              .whenComplete(logout);
        },
      );
    } else {
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 6),
        variant: SnackbarType.error,
        message: 'Invalid password. Cannot change password.',
      );
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
