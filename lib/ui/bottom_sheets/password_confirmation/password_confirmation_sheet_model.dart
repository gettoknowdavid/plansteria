import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/ui/views/account/account_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PasswordConfirmationSheetModel extends FormViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();

  User get currentUser => _authService.currentUser!;

  Future<void> submit() async {
    setBusy(true);
    final result = await _authService.login(
      email: currentUser.email,
      password: passwordValue!,
    );

    return result.fold(
      (l) {
        setBusy(false);
        _bottomSheetService.completeSheet(SheetResponse(confirmed: false));
      },
      (r) {
        setBusy(false);
        _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
