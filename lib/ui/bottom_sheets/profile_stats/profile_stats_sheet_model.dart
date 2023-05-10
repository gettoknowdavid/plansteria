// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:plansteria/app/app.locator.dart';
// import 'package:plansteria/app/app.router.dart';
// import 'package:plansteria/models/event.dart';
// import 'package:plansteria/models/user.dart';
// import 'package:plansteria/services/auth_service.dart';
// import 'package:plansteria/services/event_service.dart';
// import 'package:plansteria/services/profile_service.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// class ProfileStatsSheetModel extends FutureViewModel
//     with ListenableServiceMixin {
//   final _authService = locator<AuthService>();
//   final _eventService = locator<EventService>();
//   final _profileService = locator<ProfileService>();
//   final _bottomSheetService = locator<BottomSheetService>();
//   final _navigationService = locator<NavigationService>();

//   User get user => _authService.currentUser!;
//   late UsersViewType type;
//   late Event? event;

//   String appBarTitle = '';

//   Future get selectedFuture {
//     return Future.delayed(
//       const Duration(seconds: 1),
//       () {
//         switch (type) {
//           case UsersViewType.guests:
//             appBarTitle = 'List of Guests';
//             return _eventService.getAllGuests(event!.uid);
//           case UsersViewType.followers:
//             appBarTitle = 'Your Followers';
//             return _profileService.getAllFollowers(user.uid);
//           default:
//             appBarTitle = 'Your Following';
//             return _profileService.getAllFollowing(user.uid);
//         }
//       },
//     );
//   }

//   void close() => _bottomSheetService.completeSheet(SheetResponse());

//   Future<void> init({Event? initEvent, required UsersViewType initType}) async {
//     Future.delayed(const Duration(seconds: 1));
//     event = initEvent;
//     type = initType;
//     notifyListeners();
//   }

//   void navigateToDetails(Event event) {
//     _navigationService.navigateToEventDetailsView(event: event);
//   }

//   Future<void> navigateToUserProfile(String userId) async {
//     print(userId);
//     // await _navigationService.navigateToUserProfileView(userId: userId);
//   }

//   @override
//   Future futureToRun() => selectedFuture;

//   @override
//   List<ListenableServiceMixin> get listenableServices => [_authService];
// }

// // enum UsersViewType { guests, followers, following }

// // class UsersSheetArguments {
// //   final Key? key;
// //   final Event? event;
// //   final UsersViewType type;

// //   UsersSheetArguments({this.key, this.event, required this.type});

// //   @override
// //   String toString() {
// //     return '{"key": "$key", "event": "$event", "type": "$type}';
// //   }
// // }
