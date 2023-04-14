import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.dialogs.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/app/app.router.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel<List<Event?>> {
  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  // @override
  // Future<List<Event?>> futureToRun() => getAllEvents();

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

  Future<void> logout() async {
    _authService.logout();
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  void navigateToDetails(Event event) {
    _navigationService.navigateToNestedEventDetailsViewInLayoutViewRouter(
      event: event,
      routerId: 1,
    );
  }

  // @override
  // void onError(error) {
  //   _snackbarService.showCustomSnackBar(
  //     duration: const Duration(seconds: 6),
  //     variant: SnackbarType.error,
  //     message: error,
  //   );
  // }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void showCreateEventBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.createEvent,
      title: 'Create Event',
      isScrollControlled: true,
      takesInput: true,
      useRootNavigator: true,
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
  Stream<List<Event?>> get stream => _eventService.eventsStream;
}
