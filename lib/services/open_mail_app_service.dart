import 'package:open_mail_app/open_mail_app.dart';
import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class OpenMailAppService {
  final _dialogService = locator<DialogService>();

  Future<void> openMailApp() async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      _dialogService.showCustomDialog(variant: DialogType.noMailApp);
    } else if (!result.didOpen && result.canOpen) {
      _dialogService.showCustomDialog(
        variant: DialogType.mailApp,
        data: MailAppPickerDialog(mailApps: result.options),
      );
    }
  }
}
