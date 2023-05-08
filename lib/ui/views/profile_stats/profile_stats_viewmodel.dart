import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/profile_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileStatsViewModel extends FutureViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _profileService = locator<ProfileService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  User get user => _authService.currentUser!;
  late StatsType type;
  late Event? event;

  String appBarTitle = '';

  Future get selectedFuture {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        switch (type) {
          case StatsType.guests:
            appBarTitle = 'List of Guests';
            return _eventService.getAllGuests(event!.uid);
          case StatsType.followers:
            appBarTitle = 'Your Followers';
            return _profileService.getAllFollowers(user.uid);
          default:
            appBarTitle = 'Your Following';
            return _profileService.getAllFollowing(user.uid);
        }
      },
    );
  }

  void close() => _navigationService.back(id: 1);

  Future<void> init({Event? initEvent, required StatsType initType}) async {
    Future.delayed(const Duration(seconds: 1));
    event = initEvent;
    type = initType;
    notifyListeners();
  }

  void navigateToDetails(Event event) {
    _navigationService.navigateToEventDetailsView(event: event);
  }

  Future<void> navigateToUserProfile(String userId) async {
    await _navigationService.navigateToUserProfileView(userId: userId);
  }

  @override
  Future futureToRun() => selectedFuture;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}

enum StatsType { guests, followers, following }
