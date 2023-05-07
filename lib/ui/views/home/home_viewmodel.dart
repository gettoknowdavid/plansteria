import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/creator.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String featuredEventKey = 'featuredEventKey';
const String upcomingEventsKey = 'upcomingEventsKey';

class HomeViewModel extends MultipleStreamViewModel {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();

  List<Event?> get upcomingEvents => dataMap?[upcomingEventsKey];
  Event? get featuredEvent => dataMap?[featuredEventKey];

  bool get fetchingUpcomingEvents => busy(upcomingEventsKey);
  bool get fetchingFeaturedEvent => busy(featuredEventKey);

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

  void navigateToDetails(Event event) {
    _navigationService.navigateToEventDetailsView(event: event);
  }

  void navigateToCreateEvent() {
    _navigationService.navigateToCreateEventView();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Network Error',
      description: kNoNetworkConnectionError,
    );
  }

  @override
  Map<String, StreamData> get streamsMap => {
        upcomingEventsKey:
            StreamData<List<Event?>>(_eventService.upcomingEventsStream),
        featuredEventKey: StreamData<Event?>(_eventService.featuredEventStream),
      };
}
