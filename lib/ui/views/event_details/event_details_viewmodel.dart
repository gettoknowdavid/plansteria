import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventDetailsViewModel extends ReactiveViewModel
    with ListenableServiceMixin {
  EventDetailsViewModel() {
    listenToReactiveValues([_isAttending]);
  }
  late Event event;
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  User? get currentUser => _authService.currentUser;

  final _isAttending = ReactiveValue<bool>(false);
  bool get isAttending => _isAttending.value;

  void init(Event e) {
    event = e;
  }

  void addGuest() async {
    setBusy(true);
    final result = await _eventService.addGuest(
      event.uid,
      Guest(
        uid: currentUser!.uid,
        name: currentUser!.name,
        avatar: currentUser?.avatar,
      ),
    );
    if (result) {
      _isAttending.value = true;
      setBusy(false);
    } else {
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        message: kServerErrorMessage,
        variant: SnackbarType.error,
      );
    }
    notifyListeners();
  }

  Future<User> get getCreatorById async {
    // print('============================================');
    // print(_navigationService.currentRoute);
    // print('============================================');
    final snapshot = await userRef.doc(event.creatorId).get();
    return snapshot.data!;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
