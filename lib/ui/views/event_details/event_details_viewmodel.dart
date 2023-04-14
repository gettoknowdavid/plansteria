import 'package:intl/intl.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EventDetailsViewModel extends BaseViewModel {
  late Event event;
  final _navigationService = locator<NavigationService>();

  void init(Event e) {
    event = e;
  }

  Future<User> get getCreatorById async {
    // print('============================================');
    // print(_navigationService.currentRoute);
    // print('============================================');
    final snapshot = await userRef.doc(event.creatorId).get();
    return snapshot.data!;
  }

  
}
