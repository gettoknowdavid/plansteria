import 'package:flutter/services.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/events_list_type.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String myEventsKey = 'myEventsKey';
const String attendingEventsKey = 'attendingEventsKey';
const String attendedEventsKey = 'attendedEventsKey';

class EventsViewModel extends MultipleFutureViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();

  User get user => _authService.currentUser!;
  NetworkStatus get networkStatus => _networkService.status;

  List<Event?> get myEvents => dataMap?[myEventsKey];
  List<Event?> get attendingEvents => dataMap?[attendingEventsKey];
  List<Event?> get attendedEvents => dataMap?[attendedEventsKey];

  bool get myEventsLoading => busy(myEventsKey);
  bool get attendingEventsLoading => busy(attendingEventsKey);
  bool get attendedEventsLoading => busy(attendedEventsKey);
  bool get loading =>
      myEventsLoading || attendingEventsLoading || attendedEventsLoading;

  bool get myEventsReady => dataReady(myEventsKey);
  bool get attendingEventsReady => dataReady(attendingEventsKey);
  bool get attendedEventsReady => dataReady(attendedEventsKey);

  Future<void> onSeeMore(EventsListType listType) async {
    await _navigationService.navigateToMoreEventsView(listType: listType);
  }

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

  Future<void> navigateToCreateEvent() {
    return _navigationService.navigateToCreateEventView();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _networkService,
      ];

  Future<List<Event?>> myEventsFuture() {
    return _eventService.getMyEvents(user.uid, 2);
  }

  Future<List<Event?>> attendingEventsFuture() {
    return _eventService.getMyAttendingEvents(user.uid, 2);
  }

  Future<List<Event?>> attendedEventsFuture() {
    return _eventService.getMyAttendedEvents(user.uid, 2);
  }

  @override
  Map<String, Future Function()> get futuresMap {
    return {
      myEventsKey: myEventsFuture,
      attendingEventsKey: attendingEventsFuture,
      attendedEventsKey: attendedEventsFuture,
    };
  }
}
