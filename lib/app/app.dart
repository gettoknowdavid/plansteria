import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plansteria/ui/bottom_sheets/map_address/map_address_sheet.dart';
import 'package:plansteria/ui/views/onboarding/onboarding_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../services/services.dart';
import '../ui/bottom_sheets/bottom_sheets.dart';
import '../ui/common/common.dart';
import '../ui/dialogs/dialogs.dart';
import '../ui/layout/layout.dart';
import '../ui/views/views.dart';
import 'app.router.dart';
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
        MaterialRoute(page: EventDetailsView),
        MaterialRoute(page: CreateEventView),
        MaterialRoute(page: ProfileStatsView),
      ],
    ),
    MaterialRoute(page: EventDetailsView),
    MaterialRoute(page: ProfileStatsView),
    MaterialRoute(page: GuestsView),
    MaterialRoute(page: CreateEventView),
    MaterialRoute(page: MapView),
    MaterialRoute(page: UserProfileView),
    MaterialRoute(page: OnboardingView),
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
    LazySingleton(classType: ChatService),
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
    LazySingleton(classType: ProfileService),
    LazySingleton(classType: LocationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: EditProfileSheet),
    StackedBottomsheet(classType: ImageSourceSheet),
    StackedBottomsheet(classType: MapSheet),
    StackedBottomsheet(classType: PasswordConfirmationSheet),
    StackedBottomsheet(classType: ReAuthSheet),
    StackedBottomsheet(classType: ThemeSheet),
    StackedBottomsheet(classType: MapAddressSheet),
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
        return ThemeBuilder(
          lightTheme: lightTheme,
          darkTheme: darkTheme,
          builder: (context, regularTheme, darkTheme, themeMode) {
            return MaterialApp(
              title: 'Plansteria',
              theme: regularTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
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
      },
    );
  }
}
