import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/profile_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileViewModel extends FutureViewModel<User>
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _profileService = locator<ProfileService>();

  User get user => _authService.currentUser!;
  String get userId => _navigationService.currentArguments.userId;
  Event? get event => _navigationService.currentArguments.event;

  @override
  Future<User> futureToRun() => _authService.getUserById(userId);

  @override
  void onError(error) {
    setError(
      'Seems like this user does not exist or has been deleted from the database.',
    );
  }

  void navigateBack() => _navigationService.back(result: event);

  Future<void> follow() async => await _profileService.follow(user, data!);

  Future<void> unFollow() async {
    final response = await _dialogService.showConfirmationDialog(
      title: 'Unfollow ${data!.name}?',
      description:
          'Their events will no longer show up in your home timeline. You will still be able to view their events.',
      confirmationTitle: 'Unfollow',
      barrierDismissible: true,
    );

    if (response?.confirmed == true) {
      await _profileService.unFollow(user, data!);
    }
  }

  Stream<int> get numberOfCreatedEvents =>
      _eventService.numberOfAllCreatedEvents(userId);

  Stream<int> get followers => _profileService.followers(userId);

  Stream<int> get following => _profileService.following(userId);

  Stream<bool> get isFollowing => _profileService.isFollowing(user.uid, userId);

  Stream<List<Event?>> get myEvents => _eventService.myEventsStream(userId);

  Future<void> init() async {
    await _profileService.getAllFollowing(user.uid);
  }

  Future<void> call() => _profileService.callPhoneNumber(data!.phone!);

  Future<void> sendMail() async => _profileService.sendMail(data!.email);

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _eventService,
      ];
}
