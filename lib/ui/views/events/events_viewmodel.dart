import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventsViewModel extends FutureViewModel<List<Event?>>
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  User? get user => _authService.currentUser;

  Future<List<Event?>> getMyEvents() async {
    final result = await _eventService.getMyEvents(user!.uid);
    return result.fold(
      (failure) {
        throw Exception(
          failure.map(
            error: (value) => value,
            serverError: (_) => kServerErrorMessage,
            networkError: (_) => kNoNetworkConnectionError,
          ),
        );
      },
      (success) => success,
    );
  }

  void navigateToDetails(Event event) {
    _navigationService.navigateToEventDetailsView(event: event);
  }

  @override
  Future<List<Event?>> futureToRun() => getMyEvents();

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
