// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
<<<<<<< HEAD
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:plansteria/models/event.dart' as _i7;
import 'package:plansteria/ui/layout/layout.dart' as _i3;
import 'package:plansteria/ui/views/about/about_view.dart' as _i5;
import 'package:plansteria/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:plansteria/ui/views/profile_stats/profile_stats_viewmodel.dart'
    as _i8;
import 'package:plansteria/ui/views/views.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;
=======
import 'package:flutter/material.dart' as _i16;
import 'package:flutter/material.dart';
import 'package:plansteria/models/event.dart' as _i17;
import 'package:plansteria/ui/layout/layout_view.dart' as _i8;
import 'package:plansteria/ui/views/about/about_view.dart' as _i24;
import 'package:plansteria/ui/views/account/account_view.dart' as _i23;
import 'package:plansteria/ui/views/chat/chat_view.dart' as _i21;
import 'package:plansteria/ui/views/confirmation/confirmation_view.dart' as _i7;
import 'package:plansteria/ui/views/create_event/create_event_view.dart'
    as _i12;
import 'package:plansteria/ui/views/event_details/event_details_view.dart'
    as _i9;
import 'package:plansteria/ui/views/events/events_view.dart' as _i20;
import 'package:plansteria/ui/views/forgot_password/forgot_password_view.dart'
    as _i6;
import 'package:plansteria/ui/views/guests/guests_view.dart' as _i11;
import 'package:plansteria/ui/views/home/home_view.dart' as _i19;
import 'package:plansteria/ui/views/login/login_view.dart' as _i3;
import 'package:plansteria/ui/views/map/map_view.dart' as _i13;
import 'package:plansteria/ui/views/onboarding/onboarding_view.dart' as _i15;
import 'package:plansteria/ui/views/profile/profile_view.dart' as _i22;
import 'package:plansteria/ui/views/profile_stats/profile_stats_view.dart'
    as _i10;
import 'package:plansteria/ui/views/profile_stats/profile_stats_viewmodel.dart'
    as _i18;
import 'package:plansteria/ui/views/register/register_view.dart' as _i4;
import 'package:plansteria/ui/views/startup/startup_view.dart' as _i2;
import 'package:plansteria/ui/views/user_profile/user_profile_view.dart'
    as _i14;
import 'package:plansteria/ui/views/verification/verification_view.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i25;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const verificationView = '/verification-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const confirmationView = '/confirmation-view';

  static const layoutView = '/layout-view';

  static const eventDetailsView = '/event-details-view';

  static const profileStatsView = '/profile-stats-view';

  static const guestsView = '/guests-view';

  static const createEventView = '/create-event-view';

  static const mapView = '/map-view';

  static const userProfileView = '/user-profile-view';

  static const onboardingView = '/onboarding-view';

<<<<<<< HEAD
  static const aboutView = '/about-view';

=======
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
  static const all = <String>{
    startupView,
    loginView,
    registerView,
    verificationView,
    forgotPasswordView,
    confirmationView,
    layoutView,
    eventDetailsView,
    profileStatsView,
    guestsView,
    createEventView,
    mapView,
    userProfileView,
    onboardingView,
<<<<<<< HEAD
    aboutView,
=======
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i2.RegisterView,
    ),
    _i1.RouteDef(
      Routes.verificationView,
      page: _i2.VerificationView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i2.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.confirmationView,
      page: _i2.ConfirmationView,
    ),
    _i1.RouteDef(
      Routes.layoutView,
      page: _i3.LayoutView,
    ),
    _i1.RouteDef(
      Routes.eventDetailsView,
      page: _i2.EventDetailsView,
    ),
    _i1.RouteDef(
      Routes.profileStatsView,
      page: _i2.ProfileStatsView,
    ),
    _i1.RouteDef(
      Routes.guestsView,
      page: _i2.GuestsView,
    ),
    _i1.RouteDef(
      Routes.createEventView,
      page: _i2.CreateEventView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i2.MapView,
    ),
    _i1.RouteDef(
      Routes.userProfileView,
      page: _i2.UserProfileView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.aboutView,
      page: _i5.AboutView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i15.OnboardingView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
=======
      return _i16.MaterialPageRoute<dynamic>(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.LoginView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
=======
    _i3.LoginView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.RegisterView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.RegisterView(),
=======
    _i4.RegisterView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.RegisterView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.VerificationView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.VerificationView(),
=======
    _i5.VerificationView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.VerificationView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
    _i2.ForgotPasswordView: (data) {
      final args = data.getArgs<ForgotPasswordViewArguments>(
        orElse: () => const ForgotPasswordViewArguments(),
      );
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ForgotPasswordView(key: args.key),
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ForgotPasswordView(key: args.key),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.ConfirmationView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ConfirmationView(),
=======
    _i7.ConfirmationView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ConfirmationView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
<<<<<<< HEAD
    _i3.LayoutView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LayoutView(),
=======
    _i8.LayoutView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.LayoutView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
    _i2.EventDetailsView: (data) {
      final args = data.getArgs<EventDetailsViewArguments>(nullOk: false);
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.EventDetailsView(
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.EventDetailsView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key,
            event: args.event,
            isFromLayoutView: args.isFromLayoutView),
        settings: data,
      );
    },
    _i2.ProfileStatsView: (data) {
      final args = data.getArgs<ProfileStatsViewArguments>(nullOk: false);
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ProfileStatsView(
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ProfileStatsView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key, type: args.type, event: args.event),
        settings: data,
      );
    },
    _i2.GuestsView: (data) {
      final args = data.getArgs<GuestsViewArguments>(nullOk: false);
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.GuestsView(key: args.key, event: args.event),
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.GuestsView(key: args.key, event: args.event),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
    _i2.CreateEventView: (data) {
      final args = data.getArgs<CreateEventViewArguments>(
        orElse: () => const CreateEventViewArguments(),
      );
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.CreateEventView(
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.CreateEventView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key, editing: args.editing, event: args.event),
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.MapView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.MapView(),
=======
    _i13.MapView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.MapView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
    _i2.UserProfileView: (data) {
      final args = data.getArgs<UserProfileViewArguments>(nullOk: false);
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.UserProfileView(
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.UserProfileView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key, userId: args.userId, event: args.event),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.AboutView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.AboutView(),
        settings: data,
      );
    },
    _i15.OnboardingView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.OnboardingView(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ForgotPasswordViewArguments {
  const ForgotPasswordViewArguments({this.key});

<<<<<<< HEAD
  final _i6.Key? key;
=======
  final _i16.Key? key;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ForgotPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class EventDetailsViewArguments {
  const EventDetailsViewArguments({
    this.key,
    required this.event,
    this.isFromLayoutView = false,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final _i7.Event event;
=======
  final _i16.Key? key;

  final _i17.Event event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  final bool isFromLayoutView;

  @override
  String toString() {
    return '{"key": "$key", "event": "$event", "isFromLayoutView": "$isFromLayoutView"}';
  }

  @override
  bool operator ==(covariant EventDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.event == event &&
        other.isFromLayoutView == isFromLayoutView;
  }

  @override
  int get hashCode {
    return key.hashCode ^ event.hashCode ^ isFromLayoutView.hashCode;
  }
}

class ProfileStatsViewArguments {
  const ProfileStatsViewArguments({
    this.key,
    required this.type,
    this.event,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final _i8.StatsType type;

  final _i7.Event? event;
=======
  final _i16.Key? key;

  final _i18.StatsType type;

  final _i17.Event? event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key", "type": "$type", "event": "$event"}';
  }

  @override
  bool operator ==(covariant ProfileStatsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.type == type && other.event == event;
  }

  @override
  int get hashCode {
    return key.hashCode ^ type.hashCode ^ event.hashCode;
  }
}

class GuestsViewArguments {
  const GuestsViewArguments({
    this.key,
    required this.event,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final _i7.Event event;
=======
  final _i16.Key? key;

  final _i17.Event event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key", "event": "$event"}';
  }

  @override
  bool operator ==(covariant GuestsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.event == event;
  }

  @override
  int get hashCode {
    return key.hashCode ^ event.hashCode;
  }
}

class CreateEventViewArguments {
  const CreateEventViewArguments({
    this.key,
    this.editing = false,
    this.event,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final bool editing;

  final _i7.Event? event;
=======
  final _i16.Key? key;

  final bool editing;

  final _i17.Event? event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key", "editing": "$editing", "event": "$event"}';
  }

  @override
  bool operator ==(covariant CreateEventViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.editing == editing && other.event == event;
  }

  @override
  int get hashCode {
    return key.hashCode ^ editing.hashCode ^ event.hashCode;
  }
}

class UserProfileViewArguments {
  const UserProfileViewArguments({
    this.key,
    required this.userId,
    this.event,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final String userId;

  final _i7.Event? event;
=======
  final _i16.Key? key;

  final String userId;

  final _i17.Event? event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key", "userId": "$userId", "event": "$event"}';
  }

  @override
  bool operator ==(covariant UserProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userId == userId && other.event == event;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userId.hashCode ^ event.hashCode;
  }
}

class LayoutViewRoutes {
  static const homeView = 'home-view';

  static const eventsView = 'events-view';

  static const chatView = 'chat-view';

  static const profileView = 'profile-view';

  static const accountView = 'account-view';

  static const eventDetailsView = 'event-details-view';

  static const createEventView = 'create-event-view';

  static const profileStatsView = 'profile-stats-view';

  static const aboutView = 'about-view';

  static const all = <String>{
    homeView,
    eventsView,
    chatView,
    profileView,
    accountView,
    eventDetailsView,
    createEventView,
    profileStatsView,
    aboutView,
  };
}

class LayoutViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      LayoutViewRoutes.homeView,
<<<<<<< HEAD
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.eventsView,
      page: _i2.EventsView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.chatView,
      page: _i2.ChatView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.profileView,
      page: _i2.ProfileView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.accountView,
      page: _i2.AccountView,
=======
      page: _i19.HomeView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.eventsView,
      page: _i20.EventsView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.chatView,
      page: _i21.ChatView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.profileView,
      page: _i22.ProfileView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.accountView,
      page: _i23.AccountView,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    ),
    _i1.RouteDef(
      LayoutViewRoutes.eventDetailsView,
      page: _i2.EventDetailsView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.createEventView,
      page: _i2.CreateEventView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.profileStatsView,
      page: _i2.ProfileStatsView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.aboutView,
      page: _i24.AboutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
<<<<<<< HEAD
    _i2.HomeView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
=======
    _i19.HomeView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.HomeView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.EventsView: (data) {
      final args = data.getArgs<NestedEventsViewArguments>(
        orElse: () => const NestedEventsViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.EventsView(
=======
    _i20.EventsView: (data) {
      final args = data.getArgs<NestedEventsViewArguments>(
        orElse: () => const NestedEventsViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.EventsView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key, fromProfileView: args.fromProfileView),
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.ChatView: (data) {
      final args = data.getArgs<NestedChatViewArguments>(
        orElse: () => const NestedChatViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ChatView(key: args.key),
=======
    _i21.ChatView: (data) {
      final args = data.getArgs<NestedChatViewArguments>(
        orElse: () => const NestedChatViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.ChatView(key: args.key),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.ProfileView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ProfileView(),
=======
    _i22.ProfileView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.ProfileView(),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
<<<<<<< HEAD
    _i2.AccountView: (data) {
      final args = data.getArgs<NestedAccountViewArguments>(
        orElse: () => const NestedAccountViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.AccountView(key: args.key),
=======
    _i23.AccountView: (data) {
      final args = data.getArgs<NestedAccountViewArguments>(
        orElse: () => const NestedAccountViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.AccountView(key: args.key),
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
        settings: data,
      );
    },
    _i2.EventDetailsView: (data) {
      final args = data.getArgs<NestedEventDetailsViewArguments>(nullOk: false);
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.EventDetailsView(
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.EventDetailsView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key,
            event: args.event,
            isFromLayoutView: args.isFromLayoutView),
        settings: data,
      );
    },
    _i2.CreateEventView: (data) {
      final args = data.getArgs<NestedCreateEventViewArguments>(
        orElse: () => const NestedCreateEventViewArguments(),
      );
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.CreateEventView(
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.CreateEventView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key, editing: args.editing, event: args.event),
        settings: data,
      );
    },
    _i2.ProfileStatsView: (data) {
      final args = data.getArgs<NestedProfileStatsViewArguments>(nullOk: false);
<<<<<<< HEAD
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ProfileStatsView(
=======
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ProfileStatsView(
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
            key: args.key, type: args.type, event: args.event),
        settings: data,
      );
    },
    _i24.AboutView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.AboutView(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class NestedEventsViewArguments {
  const NestedEventsViewArguments({
    this.key,
    this.fromProfileView = false,
  });

<<<<<<< HEAD
  final _i6.Key? key;
=======
  final _i16.Key? key;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  final bool fromProfileView;

  @override
  String toString() {
    return '{"key": "$key", "fromProfileView": "$fromProfileView"}';
  }

  @override
  bool operator ==(covariant NestedEventsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.fromProfileView == fromProfileView;
  }

  @override
  int get hashCode {
    return key.hashCode ^ fromProfileView.hashCode;
  }
}

class NestedChatViewArguments {
  const NestedChatViewArguments({this.key});

<<<<<<< HEAD
  final _i6.Key? key;
=======
  final _i16.Key? key;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant NestedChatViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class NestedAccountViewArguments {
  const NestedAccountViewArguments({this.key});

<<<<<<< HEAD
  final _i6.Key? key;
=======
  final _i16.Key? key;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant NestedAccountViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class NestedEventDetailsViewArguments {
  const NestedEventDetailsViewArguments({
    this.key,
    required this.event,
    this.isFromLayoutView = false,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final _i7.Event event;
=======
  final _i16.Key? key;

  final _i17.Event event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  final bool isFromLayoutView;

  @override
  String toString() {
    return '{"key": "$key", "event": "$event", "isFromLayoutView": "$isFromLayoutView"}';
  }

  @override
  bool operator ==(covariant NestedEventDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.event == event &&
        other.isFromLayoutView == isFromLayoutView;
  }

  @override
  int get hashCode {
    return key.hashCode ^ event.hashCode ^ isFromLayoutView.hashCode;
  }
}

class NestedCreateEventViewArguments {
  const NestedCreateEventViewArguments({
    this.key,
    this.editing = false,
    this.event,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final bool editing;

  final _i7.Event? event;
=======
  final _i16.Key? key;

  final bool editing;

  final _i17.Event? event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key", "editing": "$editing", "event": "$event"}';
  }

  @override
  bool operator ==(covariant NestedCreateEventViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.editing == editing && other.event == event;
  }

  @override
  int get hashCode {
    return key.hashCode ^ editing.hashCode ^ event.hashCode;
  }
}

class NestedProfileStatsViewArguments {
  const NestedProfileStatsViewArguments({
    this.key,
    required this.type,
    this.event,
  });

<<<<<<< HEAD
  final _i6.Key? key;

  final _i8.StatsType type;

  final _i7.Event? event;
=======
  final _i16.Key? key;

  final _i18.StatsType type;

  final _i17.Event? event;
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c

  @override
  String toString() {
    return '{"key": "$key", "type": "$type", "event": "$event"}';
  }

  @override
  bool operator ==(covariant NestedProfileStatsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.type == type && other.event == event;
  }

  @override
  int get hashCode {
    return key.hashCode ^ type.hashCode ^ event.hashCode;
  }
}

<<<<<<< HEAD
extension NavigatorStateExtension on _i9.NavigationService {
=======
extension NavigatorStateExtension on _i25.NavigationService {
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLayoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.layoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEventDetailsView({
<<<<<<< HEAD
    _i6.Key? key,
    required _i7.Event event,
=======
    _i16.Key? key,
    required _i17.Event event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    bool isFromLayoutView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.eventDetailsView,
        arguments: EventDetailsViewArguments(
            key: key, event: event, isFromLayoutView: isFromLayoutView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileStatsView({
<<<<<<< HEAD
    _i6.Key? key,
    required _i8.StatsType type,
    _i7.Event? event,
=======
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.profileStatsView,
        arguments:
            ProfileStatsViewArguments(key: key, type: type, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGuestsView({
<<<<<<< HEAD
    _i6.Key? key,
    required _i7.Event event,
=======
    _i16.Key? key,
    required _i17.Event event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.guestsView,
        arguments: GuestsViewArguments(key: key, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateEventView({
<<<<<<< HEAD
    _i6.Key? key,
    bool editing = false,
    _i7.Event? event,
=======
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createEventView,
        arguments:
            CreateEventViewArguments(key: key, editing: editing, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserProfileView({
<<<<<<< HEAD
    _i6.Key? key,
    required String userId,
    _i7.Event? event,
=======
    _i16.Key? key,
    required String userId,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userProfileView,
        arguments:
            UserProfileViewArguments(key: key, userId: userId, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

<<<<<<< HEAD
  Future<dynamic> navigateToAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

=======
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
  Future<dynamic> navigateToNestedHomeViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(LayoutViewRoutes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedEventsViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    bool fromProfileView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(LayoutViewRoutes.eventsView,
        arguments: NestedEventsViewArguments(
            key: key, fromProfileView: fromProfileView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedChatViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(LayoutViewRoutes.chatView,
        arguments: NestedChatViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfileViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(LayoutViewRoutes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedAccountViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(LayoutViewRoutes.accountView,
        arguments: NestedAccountViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedEventDetailsViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
    required _i7.Event event,
=======
    _i16.Key? key,
    required _i17.Event event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    bool isFromLayoutView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(LayoutViewRoutes.eventDetailsView,
        arguments: NestedEventDetailsViewArguments(
            key: key, event: event, isFromLayoutView: isFromLayoutView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedCreateEventViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
    bool editing = false,
    _i7.Event? event,
=======
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(LayoutViewRoutes.createEventView,
        arguments: NestedCreateEventViewArguments(
            key: key, editing: editing, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfileStatsViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
    required _i8.StatsType type,
    _i7.Event? event,
=======
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(LayoutViewRoutes.profileStatsView,
        arguments:
            NestedProfileStatsViewArguments(key: key, type: type, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedAboutViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(LayoutViewRoutes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLayoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.layoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEventDetailsView({
<<<<<<< HEAD
    _i6.Key? key,
    required _i7.Event event,
=======
    _i16.Key? key,
    required _i17.Event event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    bool isFromLayoutView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.eventDetailsView,
        arguments: EventDetailsViewArguments(
            key: key, event: event, isFromLayoutView: isFromLayoutView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileStatsView({
<<<<<<< HEAD
    _i6.Key? key,
    required _i8.StatsType type,
    _i7.Event? event,
=======
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.profileStatsView,
        arguments:
            ProfileStatsViewArguments(key: key, type: type, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGuestsView({
<<<<<<< HEAD
    _i6.Key? key,
    required _i7.Event event,
=======
    _i16.Key? key,
    required _i17.Event event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.guestsView,
        arguments: GuestsViewArguments(key: key, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateEventView({
<<<<<<< HEAD
    _i6.Key? key,
    bool editing = false,
    _i7.Event? event,
=======
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createEventView,
        arguments:
            CreateEventViewArguments(key: key, editing: editing, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMapView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mapView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserProfileView({
<<<<<<< HEAD
    _i6.Key? key,
    required String userId,
    _i7.Event? event,
=======
    _i16.Key? key,
    required String userId,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userProfileView,
        arguments:
            UserProfileViewArguments(key: key, userId: userId, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

<<<<<<< HEAD
  Future<dynamic> replaceWithAboutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

=======
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
  Future<dynamic> replaceWithNestedHomeViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(LayoutViewRoutes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedEventsViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    bool fromProfileView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(LayoutViewRoutes.eventsView,
        arguments: NestedEventsViewArguments(
            key: key, fromProfileView: fromProfileView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedChatViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(LayoutViewRoutes.chatView,
        arguments: NestedChatViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedProfileViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(LayoutViewRoutes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedAccountViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
=======
    _i16.Key? key,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(LayoutViewRoutes.accountView,
        arguments: NestedAccountViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedEventDetailsViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
    required _i7.Event event,
=======
    _i16.Key? key,
    required _i17.Event event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    bool isFromLayoutView = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(LayoutViewRoutes.eventDetailsView,
        arguments: NestedEventDetailsViewArguments(
            key: key, event: event, isFromLayoutView: isFromLayoutView),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedCreateEventViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
    bool editing = false,
    _i7.Event? event,
=======
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(LayoutViewRoutes.createEventView,
        arguments: NestedCreateEventViewArguments(
            key: key, editing: editing, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedProfileStatsViewInLayoutViewRouter({
<<<<<<< HEAD
    _i6.Key? key,
    required _i8.StatsType type,
    _i7.Event? event,
=======
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
>>>>>>> ddc3022c4ba3d9ccd545646bfa82bb7d8cbc3b1c
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(LayoutViewRoutes.profileStatsView,
        arguments:
            NestedProfileStatsViewArguments(key: key, type: type, event: event),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedAboutViewInLayoutViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(LayoutViewRoutes.aboutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
