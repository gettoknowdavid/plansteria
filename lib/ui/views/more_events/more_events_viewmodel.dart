import 'package:flutter/services.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/events_list_type.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MoreEventsViewModel extends FutureViewModel<List<Event?>>
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _networkService = locator<NetworkService>();

  NetworkStatus get networkStatus => _networkService.status;

  String get userId => _authService.currentUser!.uid;

  final _title = ReactiveValue<String>('');
  String get title => _title.value;

  EventsListType get listType => _navigationService.currentArguments.listType;

  Future<List<Event?>> getEvents() async {
    switch (listType) {
      case EventsListType.myEvents:
        _title.value = 'My Events';
        return _eventService.getMyEvents(userId);
      case EventsListType.attendedEvents:
        _title.value = 'Attended';
        return _eventService.getMyAttendedEvents(userId);
      case EventsListType.attendingEvent:
        _title.value = 'Attending';
        return _eventService.getMyAttendingEvents(userId);
      default:
        return _eventService.getMyEvents(userId);
    }
  }

  Future<void> navigateToDetails(Event event) async {
    if (networkStatus == NetworkStatus.disconnected) {
      return await HapticFeedback.vibrate();
    }

    return await _navigationService.navigateToEventDetailsView(event: event);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _authService,
        _networkService,
      ];

  @override
  Future<List<Event?>> futureToRun() => getEvents();
}
