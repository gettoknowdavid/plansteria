import 'package:flutter/material.dart';
import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/ui/views/chat/chat_view.dart';
import 'package:plansteria/ui/views/events/events_view.dart';
import 'package:plansteria/ui/views/home/home_view.dart';
import 'package:plansteria/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LayoutViewModel extends IndexTrackingViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  Widget get getView {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const EventsView();
      case 2:
        return const ChatView();
      case 3:
        return const ProfileView();
      default:
        return const SizedBox();
    }
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
}
