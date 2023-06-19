// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:plansteria/ui/bottom_sheets/theme/theme_sheet.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/bottom_sheets/edit_profile/edit_profile_sheet.dart';
import '../ui/bottom_sheets/image_source/image_source_sheet.dart';
import '../ui/bottom_sheets/map/map_sheet.dart';
import '../ui/bottom_sheets/map_address/map_address_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/password_confirmation/password_confirmation_sheet.dart';
<<<<<<< HEAD
import '../ui/bottom_sheets/re_auth/re_auth_sheet.dart';
import '../ui/bottom_sheets/theme/theme_sheet.dart';
=======
import 'app.locator.dart';
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

enum BottomSheetType {
  notice,
  editProfile,
  imageSource,
  map,
  passwordConfirmation,
<<<<<<< HEAD
  reAuth,
  theme,
  mapAddress,
=======
  theme,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.editProfile: (context, request, completer) =>
        EditProfileSheet(request: request, completer: completer),
    BottomSheetType.imageSource: (context, request, completer) =>
        ImageSourceSheet(request: request, completer: completer),
    BottomSheetType.map: (context, request, completer) =>
        MapSheet(request: request, completer: completer),
    BottomSheetType.passwordConfirmation: (context, request, completer) =>
        PasswordConfirmationSheet(request: request, completer: completer),
<<<<<<< HEAD
    BottomSheetType.reAuth: (context, request, completer) =>
        ReAuthSheet(request: request, completer: completer),
    BottomSheetType.theme: (context, request, completer) =>
        ThemeSheet(request: request, completer: completer),
    BottomSheetType.mapAddress: (context, request, completer) =>
        MapAddressSheet(request: request, completer: completer),
=======
    BottomSheetType.theme: (context, request, completer) =>
        ThemeSheet(request: request, completer: completer),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
