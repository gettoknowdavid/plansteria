import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/media_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:plansteria/services/open_mail_app_service.dart';
import 'package:plansteria/services/secure_storage_service.dart';
import 'package:plansteria/ui/bottom_sheets/edit_profile/edit_profile_sheet.dart';
import 'package:plansteria/ui/bottom_sheets/image_source/image_source_sheet.dart';
import 'package:plansteria/ui/bottom_sheets/map/map_sheet.dart';
import 'package:plansteria/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:plansteria/ui/common/app_theme.dart';
import 'package:plansteria/ui/dialogs/about_app/about_app_dialog.dart';
import 'package:plansteria/ui/dialogs/error/error_dialog.dart';
import 'package:plansteria/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:plansteria/ui/dialogs/mail_app/mail_app_dialog.dart';
import 'package:plansteria/ui/dialogs/network_error/network_error_dialog.dart';
import 'package:plansteria/ui/dialogs/no_mail_app/no_mail_app_dialog.dart';
import 'package:plansteria/ui/layout/layout_view.dart';
import 'package:plansteria/ui/views/account/account_view.dart';
import 'package:plansteria/ui/views/chat/chat_view.dart';
import 'package:plansteria/ui/views/confirmation/confirmation_view.dart';
import 'package:plansteria/ui/views/create_event/create_event_view.dart';
import 'package:plansteria/ui/views/event_details/event_details_view.dart';
import 'package:plansteria/ui/views/events/events_view.dart';
import 'package:plansteria/ui/views/forgot_password/forgot_password_view.dart';
import 'package:plansteria/ui/views/home/home_view.dart';
import 'package:plansteria/ui/views/login/login_view.dart';
import 'package:plansteria/ui/views/map/map_view.dart';
import 'package:plansteria/ui/views/profile/profile_view.dart';
import 'package:plansteria/ui/views/register/register_view.dart';
import 'package:plansteria/ui/views/startup/startup_view.dart';
import 'package:plansteria/ui/views/verification/verification_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: VerificationView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: ConfirmationView),
    MaterialRoute(
      page: LayoutView,
      children: [
        MaterialRoute(page: HomeView),
        MaterialRoute(page: EventsView),
        MaterialRoute(page: ChatView),
        MaterialRoute(page: ProfileView),
        MaterialRoute(page: AccountView),
      ],
    ),
    MaterialRoute(page: EventDetailsView),
    MaterialRoute(page: CreateEventView),
    MaterialRoute(page: MapView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: SecureStorageService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: OpenMailAppService),
    LazySingleton(classType: EventService),
    LazySingleton(classType: MediaService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: EditProfileSheet),
    StackedBottomsheet(classType: ImageSourceSheet),
    StackedBottomsheet(classType: MapSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: ErrorDialog),
    StackedDialog(classType: NetworkErrorDialog),
    StackedDialog(classType: NoMailAppDialog),
    StackedDialog(classType: MailAppDialog),
    StackedDialog(classType: AboutAppDialog),
// @stacked-dialog
  ],
)
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Plansteria',
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [StackedService.routeObserver],
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        );
      },
    );
  }
}
