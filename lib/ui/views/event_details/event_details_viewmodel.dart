import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventDetailsViewModel extends FutureViewModel<Event>
    with ListenableServiceMixin {
  // late Event event;
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _isAttending = ReactiveValue<bool>(false);
  final _currentIndex = ReactiveValue<int>(0);

  EventDetailsViewModel() {
    listenToReactiveValues([_isAttending, _currentIndex]);
  }

  int get currentIndex => _currentIndex.value;

  User? get currentUser => _authService.currentUser;

  String get eventId => _navigationService.currentArguments.event.uid;

  Future<User> get getCreatorById async {
    final snapshot = await userRef.doc(data?.creatorId).get();
    return snapshot.data!;
  }

  bool get isAttending => _isAttending.value;

  bool get isAuthUser => data?.creatorId == currentUser?.uid;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  void addGuest() async {
    setBusy(true);
    final result = await _eventService.addGuest(
      data!.uid,
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

  @override
  Future<Event> futureToRun() async => await _eventService.getEvent(eventId);

  void onEditPressed() async {
    await _navigationService.navigateToCreateEventView(
      editing: true,
      event: data,
    );
  }

  Future<void> onDeletePressed(String eventId) async {
    final response = await _dialogService.showConfirmationDialog(
      title: 'Delete Event',
      description: 'You are about to delete this event. It cannot be undone',
      confirmationTitle: 'Delete',
      cancelTitle: 'Cancel',
      barrierDismissible: true,
    );
    if (response?.confirmed == true) {
      setBusy(true);
      await _eventService.deleteEvent(eventId).whenComplete(() {
        _navigationService.popRepeated(1);
      });
    }
  }

  void setPhotoIndex(int index) {
    _currentIndex.value = index;
  }
}
