import 'package:flutter/services.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventsViewModel extends FutureViewModel<List<Event?>>
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();

  User get user => _authService.currentUser!;
  NetworkStatus get networkStatus => _networkService.status;

  Future<void> navigateToDetails(Event event) async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    }

    return await _navigationService
        .navigateToNestedEventDetailsViewInLayoutViewRouter(
      event: event,
      routerId: 1,
      isFromLayoutView: true,
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _networkService,
      ];

  @override
  Future<List<Event?>> futureToRun() => _eventService.getMyEvents(user.uid);
}
