import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/creator.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/events_list_type.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String featuredEventKey = 'featuredEventKey';
const String upcomingEventsKey = 'upcomingEventsKey';

class HomeViewModel extends MultipleStreamViewModel {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _eventService = locator<EventService>();
  final _navService = locator<NavigationService>();
  List<Event?> get upcomingEvents => dataMap?[upcomingEventsKey];
  Event? get featuredEvent => dataMap?[featuredEventKey];
  bool get fetchingUpcomingEvents => busy(upcomingEventsKey);
  bool get fetchingFeaturedEvent => busy(featuredEventKey);
  bool get upcomingReady => dataReady(upcomingEventsKey);
  bool get isUpcomingEmpty => dataMap?[upcomingEventsKey]?.isEmpty == true;

  Future<List<Guest?>> get getGuests async {
    if (featuredEvent != null) {
      return await _eventService.allGuests(featuredEvent!.uid);
    } else {
      return [];
    }
  }

  Future<Creator> get getCreator async {
    final user = await _authService.getUserById(featuredEvent!.creatorId);
    return Creator.fromUser(user);
  }

  void navigateToCreateEvent() => _navService.navigateToCreateEventView();

  void navigateToDetails(Event e) =>
      _navService.navigateToEventDetailsView(event: e);

  void showDialog() => _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Network Error',
        description: kNoNetworkConnectionError,
      );

  Future<void> onSeeMoreUpcoming() async {
    await _navService.navigateToMoreEventsView(
      listType: EventsListType.upcomingEvents,
    );
  }

  @override
  Map<String, StreamData> get streamsMap => {
        upcomingEventsKey:
            StreamData<List<Event?>>(_eventService.upcomingEventsStream),
        featuredEventKey: StreamData<Event?>(_eventService.featuredEventStream),
      };
}
