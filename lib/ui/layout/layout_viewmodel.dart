import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/auth_service.dart';
import 'package:plansteria/ui/views/chat/chat_view.dart';
import 'package:plansteria/ui/views/events/events_view.dart';
import 'package:plansteria/ui/views/home/home_view.dart';
import 'package:plansteria/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LayoutViewModel extends IndexTrackingViewModel
    with ListenableServiceMixin {
  final _authService = locator<AuthService>();

  final _navigationService = locator<NavigationService>();

  String? get firstName => '${user?.name.split(' ')[0]}';

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  User? get user => _authService.currentUser;

  void handleNavigation(int index) {
    switch (index) {
      case 0:
        setIndex(0);
        _navigationService.replaceWithTransition(
          const HomeView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 1:
        setIndex(1);
        _navigationService.replaceWithTransition(
          const EventsView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 2:
        setIndex(2);
        _navigationService.replaceWithTransition(
          const ChatView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      case 3:
        setIndex(3);
        _navigationService.replaceWithTransition(
          const ProfileView(),
          transitionStyle: Transition.fade,
          id: 1,
        );
        break;
      default:
    }
    notifyListeners();
  }
}
