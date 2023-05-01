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

class EventDetailsViewModel extends MultipleStreamViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _isAttendingReactive = ReactiveValue<bool>(false);
  final _currentImageIndex = ReactiveValue<int>(0);

  EventDetailsViewModel() {
    listenToReactiveValues([_isAttendingReactive, _currentImageIndex]);
  }

  Event get event => dataMap?[eventKey];
  bool get isAttending => dataMap?[isAttendingKey];

  bool get fetchingEvent => !dataReady(eventKey);
  bool get fetchingIsAttending => !dataReady(isAttendingKey);

  int get currentImageIndex => _currentImageIndex.value;
  bool get isAttendingReactive => _isAttendingReactive.value;

  User? get currentUser => _authService.currentUser;

  String get eventId => _navigationService.currentArguments.event.uid;

  bool get isAuthUser => event.creator.uid == currentUser?.uid;

  bool get isPaid => event.price != null;

  Stream<int> get numberOfGuestsStream {
    return _eventService.numberOfGuestsStream(eventId);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> onAttendPressed() async {
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
      (success) => _isAttendingReactive.value = true,
    );
    notifyListeners();
  }

  Future<void> onLeavePressed() async {
    final result = await _eventService.removeGuest(event.uid, currentUser!.uid);

    result.fold(
      (failure) {
        _snackbarService.showCustomSnackBar(
          variant: SnackbarType.error,
          message: failure.maybeMap(
            orElse: () => '',
            serverError: (_) => kServerErrorMessage,
            networkError: (_) => kNoNetworkConnectionError,
          ),
        );
      },
      (success) => _isAttendingReactive.value = false,
    );
    notifyListeners();
  }

  Stream<Event> get eventStream => _eventService.eventStream(eventId);

  Stream<bool> get isAttendingStream => _eventService.isAttendingStream(
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
    _currentImageIndex.value = index;
  }

  Future<void> navigateToGuestsList() async {
    await _navigationService.navigateToGuestsView(event: event);
  }

  @override
  Map<String, StreamData> get streamsMap => {
        eventKey: StreamData<Event>(eventStream),
        isAttendingKey: StreamData<bool>(isAttendingStream),
      };
}
