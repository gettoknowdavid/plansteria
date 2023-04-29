import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/media_service.dart';
import 'package:plansteria/ui/bottom_sheets/edit_profile/edit_profile_sheet.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileSheetModel extends FormViewModel with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();

  User? get user => _authService.currentUser;

  bool get disabled => !hasName;

  Future<void> showImageSourceBottomSheet() async {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.imageSource,
      isScrollControlled: true,
      enterBottomSheetDuration: const Duration(milliseconds: 100),
    );
  }

  void close() => _bottomSheetService.completeSheet(SheetResponse());

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
