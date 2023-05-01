import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventsViewModel extends StreamViewModel<List<Event?>>
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  User get user => _authService.currentUser!;

  void navigateToDetails(Event event) {
    _navigationService.navigateToEventDetailsView(event: event);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  @override
  Stream<List<Event?>> get stream => _eventService.myEventsStream(user.uid);
}
