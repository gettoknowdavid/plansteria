import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/profile_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel with Initialisable {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _bottomSheetService = locator<BottomSheetService>();
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
