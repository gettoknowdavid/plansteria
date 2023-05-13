// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/edit_profile/edit_profile_sheet.dart';
import '../ui/bottom_sheets/image_source/image_source_sheet.dart';
import '../ui/bottom_sheets/map/map_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/password_confirmation/password_confirmation_sheet.dart';

enum BottomSheetType {
  notice,
  editProfile,
  imageSource,
  map,
  passwordConfirmation,
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
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
