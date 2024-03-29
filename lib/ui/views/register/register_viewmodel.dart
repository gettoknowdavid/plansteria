import 'package:flutter/material.dart';
import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:plansteria/ui/common/common.dart';
import 'package:plansteria/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel with ListenableServiceMixin {
  RegisterViewModel() {
    listenToReactiveValues([_rules, _rulesVisibility, _ruleColor]);
  }
  final _authService = locator<AuthService>();

  final _dialogService = locator<DialogService>();

  final _networkService = locator<NetworkService>();

  final _snackbarService = locator<SnackbarService>();

  final _navigationService = locator<NavigationService>();

  final _rules = ReactiveValue<List<Map>>(passwordRules);

  final _rulesVisibility = ReactiveValue<bool>(false);

  final _ruleColor = ReactiveValue<Color>(Colors.grey);

  bool get disabled =>
      !isFormValid || !hasName || !hasEmail || !hasPassword || isBusy;

  void navigateBack() => _navigationService.back();

  void navigateBackToLoginView() => _navigationService.navigateToLoginView();

  List<Map> get rules => _rules.value;
  Color get rulesColor => _ruleColor.value;

  bool get rulesVisibility => _rulesVisibility.value;

  @override
  List<ListenableServiceMixin> get listenableServices => [_networkService];

  NetworkStatus get networkStatus => _networkService.status;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (networkStatus == NetworkStatus.disconnected) {
      _dialogService.showCustomDialog(variant: DialogType.networkError);
    } else {
      setBusy(true);
      final result = await _authService.register(
        name: name,
        email: email,
        password: password,
      );

      result.fold(
        (failure) {
          setBusy(false);
          _snackbarService.showCustomSnackBar(
            duration: const Duration(seconds: 6),
            variant: SnackbarType.error,
            message: failure.maybeMap(
              orElse: () => '',
              serverError: (_) => kServerErrorMessage,
              emailInUse: (_) => kEmailAlreadyInUseErrorMessage,
            ),
          );
        },
        (_) async {
          await _authService.sendVerificationEmail();
          _navigationService.clearStackAndShow(Routes.verificationView);
        },
      );
    }
  }
}
