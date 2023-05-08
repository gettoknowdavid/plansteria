import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/profile_service.dart';
import 'package:plansteria/ui/bottom_sheets/users/profile_stats_sheet_model.dart';
import 'package:plansteria/ui/views/profile_stats/profile_stats_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _profileService = locator<ProfileService>();

  User get user => _authService.currentUser!;

  Future<void> logout() async {
    setBusy(true);
    await _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future<void> showEditProfileBottomSheet() async {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.editProfile,
      isScrollControlled: true,
    );
  }

  Stream<int> get numberOfCreatedEvents =>
      _eventService.numberOfAllCreatedEvents(user.uid);

  Stream<int> get followers => _profileService.followers(user.uid);

  Stream<int> get following => _profileService.following(user.uid);

  Future<void> viewAllFollowers() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.profileStats,
      isScrollControlled: true,
      data: UsersSheetArguments(type: UsersViewType.followers),
      takesInput: true,
      barrierDismissible: false,
      enableDrag: false,
    );
  }

  Future<void> viewAllFollowing() async {
    await _navigationService.navigateToNestedProfileStatsViewInLayoutViewRouter(
      type: StatsType.following,
      routerId: 1,
    );
    // await _bottomSheetService.showCustomSheet(
    //   variant: BottomSheetType.profileStats,
    //   isScrollControlled: true,
    //   data: UsersSheetArguments(type: UsersViewType.following),
    //   takesInput: true,
    //   barrierDismissible: false,
    //   enableDrag: false,
    // );
  }

  Future<void> viewAllEvents() async {
    await _navigationService.navigateToNestedEventsViewInLayoutViewRouter(
      fromProfileView: true,
      routerId: 1,
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _eventService,
      ];

  @override
  Future<void> initialise() async {
    await _authService.getAuthUser();
  }
}
