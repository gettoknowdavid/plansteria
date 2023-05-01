import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/services/event_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GuestsViewModel extends StreamViewModel<List<Guest?>> {
  final _eventService = locator<EventService>();
  final _navigationService = locator<NavigationService>();

  Event get event => _navigationService.currentArguments.event;

  @override
  Stream<List<Guest?>> get stream => _eventService.guestsStream(event.uid);
}
