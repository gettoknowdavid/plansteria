import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/creator.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/bottom_sheets/users/profile_stats_sheet_model.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String eventKey = 'eventKey';
const String isAttendingKey = 'isAttendingKey';

class EventDetailsViewModel extends ReactiveViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _isAttendingReactive = ReactiveValue<bool>(false);
  final _currentImageIndex = ReactiveValue<int>(0);
  final _event = ReactiveValue<Event?>(null);
  final _isAttending = ReactiveValue<bool>(false);
  final _isFromLayoutView = ReactiveValue<bool>(false);
  final _bottomSheetService = locator<BottomSheetService>();

  EventDetailsViewModel() {
    listenToReactiveValues([
      _isAttendingReactive,
      _currentImageIndex,
      _event,
      _isAttending,
      _isAttending,
    ]);
  }

  Event? get event => _event.value;
  bool get isAttending => _isAttending.value;

  // bool get fetchingEvent => !dataReady(eventKey);
  // bool get fetchingIsAttending => !dataReady(isAttendingKey);

  int get currentImageIndex => _currentImageIndex.value;
  bool get isAttendingReactive => _isAttendingReactive.value;

  User? get currentUser => _authService.currentUser;

  bool get isAuthUser => event?.creatorId == currentUser?.uid;

  bool get isPaid => event?.price != null;

  Stream<int> numberOfGuestsStream(String id) {
    return _eventService.numberOfGuestsStream(id);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  Future<void> onAttendPressed() async {
    final result = await _eventService.addGuest(
      event!.uid,
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
    final result =
        await _eventService.removeGuest(event!.uid, currentUser!.uid);

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

  Future<void> navigateToUserProfile() async {
    await _navigationService.navigateToUserProfileView(
      userId: event!.creatorId,
      event: event!,
    );
  }

  Future<void> onEditPressed() {
    if (_isFromLayoutView.value == false) {
      return _navigationService.navigateToCreateEventView(
        editing: true,
        event: event,
      );
    }
    return _navigationService.navigateToNestedCreateEventViewInLayoutViewRouter(
      editing: true,
      event: event,
      routerId: 1,
    );
  }

  Future init(String id, bool isFromLayoutView) async {
    setBusy(true);

    _event.value = await _eventService.getEvent(id);
    _isAttending.value = await _eventService.isAttending(id, currentUser!.uid);
    _isFromLayoutView.value = isFromLayoutView;
    setBusy(false);
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
    _currentImageIndex.value = index;
  }

  Future<void> navigateToGuestsList() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.profileStats,
      isScrollControlled: true,
      data: UsersSheetArguments(type: UsersViewType.guests, event: event),
      takesInput: true,
    );
  }

  Future<Creator> getCreator() async {
    final creatorUser = await _authService.getUserById(event!.creatorId);
    return Creator.fromUser(creatorUser);
  }

  // @override
  // Map<String, StreamData> get streamsMap => {
  //       eventKey: StreamData<Event>(eventStream),
  //       isAttendingKey: StreamData<bool>(isAttendingStream),
  //     };
}
