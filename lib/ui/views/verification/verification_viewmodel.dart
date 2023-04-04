import 'dart:async';

import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/open_mail_app_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class VerificationViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _openMailAppService = locator<OpenMailAppService>();

  Timer? timer;

  bool get isAuthenticated => _authService.isAuthenticated;

  bool? get isEmailVerified => _authService.isEmailVerified;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> cancel() => Future.wait([_authService.logout()]);

  Future<void> checkEmailVerified() async {
    final result = await _authService.checkEmailVerified();
    result.fold(
      () => _navigationService.clearStackAndShow(Routes.loginView),
      (either) {
        either.fold(
          (failure) => null,
          (success) => _navigationService.clearStackAndShow(Routes.layoutView),
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Future<void> initialise() async {
    if (isEmailVerified == false) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
        await checkEmailVerified();
      });
    }
  }

  Future<void> openMailApp() async {
    await _openMailAppService.openMailApp();
  }

  Future<void> sendVerification() async {
    final result = await _authService.sendVerificationEmail();

    result.fold(
      (failure) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            userNotFound: (_) => kNoUserFoundErrorMessage,
          ),
        );
      },
      (success) {
        _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 6),
          variant: SnackbarType.success,
          message: kVerificationEmailSentSuccess,
        );
      },
    );
  }
}
