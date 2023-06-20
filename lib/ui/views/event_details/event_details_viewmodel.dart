import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/app/app.snackbars.dart';
import 'package:plansteria/models/creator.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:plansteria/ui/views/profile_stats/profile_stats_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String eventKey = 'eventKey';
const String isAttendingKey = 'isAttendingKey';

class EventDetailsViewModel extends ReactiveViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _eventService = locator<EventService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _isAttendingReactive = ReactiveValue<bool>(false);
  final _currentImageIndex = ReactiveValue<int>(0);
  final _event = ReactiveValue<Event?>(null);
  final _isAttending = ReactiveValue<bool>(false);
  final _isFromLayoutView = ReactiveValue<bool>(false);

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
    setBusyForObject(isAttendingReactive, true);
    final result = await _eventService.addGuest(
      event!.uid,
      Guest(
        uid: currentUser!.uid,
        name: currentUser!.name,
        avatar: currentUser?.avatar,
      ),
    );

    result.fold((failure) {
      setBusy(false);
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: failure.maybeMap(
          orElse: () => '',
          serverError: (_) => kServerErrorMessage,
          networkError: (_) => kNoNetworkConnectionError,
        ),
      );
    }, (success) async {
      setBusyForObject(isAttendingReactive, false);
      _isAttendingReactive.value = true;
      await init(event!.uid, true);
    });
    notifyListeners();
  }

  Future<void> onLeavePressed() async {
    setBusyForObject(isAttendingReactive, true);
    final result =
        await _eventService.removeGuest(event!.uid, currentUser!.uid);

    result.fold((failure) {
      _snackbarService.showCustomSnackBar(
        variant: SnackbarType.error,
        message: failure.maybeMap(
          orElse: () => '',
          serverError: (_) => kServerErrorMessage,
          networkError: (_) => kNoNetworkConnectionError,
        ),
      );
    }, (success) async {
      setBusyForObject(isAttendingReactive, false);
      _isAttendingReactive.value = false;
      await init(event!.uid, true);
    });
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
    await _navigationService.navigateToProfileStatsView(
      type: StatsType.guests,
      event: event,
    );
  }

  Future<Creator> getCreator() async {
    final creatorUser = await _authService.getUserById(event!.creatorId);
    return Creator.fromUser(creatorUser);
  }

  Future<void> showMapBottomSheet() async {
    if (event?.geo != null) {
      await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.map,
        isScrollControlled: true,
        data: event,
        takesInput: true,
      );
    } else {
      await _bottomSheetService.showBottomSheet(
        title: '${event?.address}',
        description: '${event?.city}, ${event?.state}',
      );
    }
  }
}
