import 'dart:io';

import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/media_service.dart';
import 'package:plansteria/ui/bottom_sheets/edit_profile/edit_profile_sheet.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileSheetModel extends FormViewModel with ListenableServiceMixin {
  EditProfileSheetModel() {
    listenToReactiveValues([_avatar, _file]);
  }

  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();

  final _file = ReactiveValue<File?>(null);
  File? get file => _file.value;

  final _avatar = ReactiveValue<String?>(null);
  String? get avatar => _avatar.value;

  bool get hasImage =>
      user.avatar != null || user.avatar != "" || _file.value != null;

  User get user => _authService.currentUser!;

  Future<void> updateProfile() async {
    setBusy(true);
    final name = "${user.uid}.jpg";
    if (_file.value != null) {
      final ref = _mediaService.storageRef.child('images/avatar/$name');
      await _mediaService.uploadFileToCloud(_file.value!.path, name, ref);
      _avatar.value = await _mediaService.getFileFromCloud(ref);
    }

    String? phoneNumber;
    if (hasPhone) {
      phoneNumber = "+234$phoneValue";
    }

    final updatedUser = user.copyWith(
      avatar: _avatar.value ?? user.avatar,
      name: nameValue ?? user.name,
      phone: phoneNumber ?? user.phone,
    );

    await _authService.updateProfile(updatedUser);

    notifyListeners();
    _bottomSheetService.completeSheet(SheetResponse());
  }

  Future<File?> showImageSourceBottomSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.imageSource,
      enterBottomSheetDuration: const Duration(milliseconds: 100),
    );
    _file.value = response?.data;
    return response?.data;
  }

  void close() => _bottomSheetService.completeSheet(SheetResponse());

  Future<void> init() async {
    await _authService.getAuthUser();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
