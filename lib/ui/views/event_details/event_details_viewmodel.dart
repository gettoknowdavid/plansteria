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

const String eventKey = 'eventKey';
const String isAttendingKey = 'isAttendingKey';

class EventDetailsViewModel extends MultipleFutureViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _isAttendingReactive = ReactiveValue<bool>(false);
  final _currentIndex = ReactiveValue<int>(0);

  EventDetailsViewModel() {
    listenToReactiveValues([_isAttendingReactive, _currentIndex]);
  }

  Event get event => dataMap?[eventKey];
  bool get isAttending => dataMap?[isAttendingKey];

  bool get fetchingEvent => busy(eventKey);
  bool get fetchingIsAttending => busy(isAttendingKey);

  int get currentIndex => _currentIndex.value;
  bool get isAttendingReactive => _isAttendingReactive.value;

  User? get currentUser => _authService.currentUser;

  String get eventId => _navigationService.currentArguments.event.uid;

  Future<User> get getCreatorById async {
    final snapshot = await userRef.doc(event.creatorId).get();
    return snapshot.data!;
  }

  // bool get isAttending => _isAttending.value;

  bool get isAuthUser => event.creatorId == currentUser?.uid;

  bool get isPaid => event.price != null;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> onAttendPressed() async {
    setBusy(true);
    final result = await _eventService.addGuest(
      event.uid,
      Guest(
        uid: currentUser!.uid,
        name: currentUser!.name,
        avatar: currentUser?.avatar,
      ),
    );

    result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            networkError: (_) => kNoNetworkConnectionError,
          ),
        );
      },
      (success) {
        _isAttendingReactive.value = true;
        initialise();
        setBusy(false);
      },
    );
    notifyListeners();
  }

  Future<void> onLeavePressed() async {
    setBusy(true);
    final result = await _eventService.removeGuest(event.uid, currentUser!.uid);

    result.fold(
      (failure) {
        setBusy(false);
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            networkError: (_) => kNoNetworkConnectionError,
          ),
        );
      },
      (success) {
        _isAttendingReactive.value = false;
        initialise();
        setBusy(false);
      },
    );
    notifyListeners();
  }

  Future<Event> getEvent() async => await _eventService.getEvent(eventId);
  Future<bool> getIsAttending() async => await _eventService.isAttending(
        eventId,
        currentUser!.uid,
      );

  void onEditPressed() async {
    await _navigationService.navigateToCreateEventView(
      editing: true,
      event: event,
    );
  }

  Future init() async {}

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

  @override
  Map<String, Future Function()> get futuresMap => {
        eventKey: getEvent,
        isAttendingKey: getIsAttending,
      };
}
