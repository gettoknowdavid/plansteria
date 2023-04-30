import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
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
  final _snackbarService = locator<SnackbarService>();

  List<Event?> get upcomingEvents => dataMap?[upcomingEventsKey];
  Event? get featuredEvent => dataMap?[featuredEventKey];

  bool get fetchingUpcomingEvents => busy(upcomingEventsKey);
  bool get fetchingFeaturedEvent => busy(featuredEventKey);

  Future<List<Event?>> getAllEvents() async {
    final result = await _eventService.getAllEvents();
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

  Future<List<Guest?>> get getGuests async {
    if (featuredEvent != null) {
      return await _eventService.allGuests(featuredEvent!.uid);
    } else {
      return [];
    }
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

  Future<User?> get getCreatorById async {
    if (featuredEvent != null) {
      final snapshot = await userRef.doc(featuredEvent!.creatorId).get();
      return snapshot.data!;
    } else {
      return null;
    }
  }

  @override
  Map<String, StreamData> get streamsMap => {
        upcomingEventsKey:
            StreamData<List<Event?>>(_eventService.upcomingEventsStream),
        featuredEventKey: StreamData<Event?>(_eventService.featuredEventStream),
      };
}
