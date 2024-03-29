// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:plansteria/models/event.dart' as _i8;
import 'package:plansteria/models/events_list_type.dart' as _i10;
import 'package:plansteria/ui/layout/layout_view.dart' as _i3;
import 'package:plansteria/ui/views/about/about_view.dart' as _i5;
import 'package:plansteria/ui/views/more_events/more_events_view.dart' as _i6;
import 'package:plansteria/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:plansteria/ui/views/profile_stats/profile_stats_viewmodel.dart'
    as _i9;
import 'package:plansteria/ui/views/views.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

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

  static const aboutView = '/about-view';

  static const moreEventsView = '/more-events-view';

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
    aboutView,
    moreEventsView,
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
      Routes.moreEventsView,
      page: _i6.MoreEventsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i2.LoginView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i2.RegisterView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.RegisterView(),
        settings: data,
      );
    },
    _i2.VerificationView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.VerificationView(),
        settings: data,
      );
    },
    _i2.ForgotPasswordView: (data) {
      final args = data.getArgs<ForgotPasswordViewArguments>(
        orElse: () => const ForgotPasswordViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ForgotPasswordView(key: args.key),
        settings: data,
      );
    },
    _i2.ConfirmationView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ConfirmationView(),
        settings: data,
      );
    },
    _i3.LayoutView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LayoutView(),
        settings: data,
      );
    },
    _i2.EventDetailsView: (data) {
      final args = data.getArgs<EventDetailsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.EventDetailsView(
            key: args.key,
            event: args.event,
            isFromLayoutView: args.isFromLayoutView),
        settings: data,
      );
    },
    _i2.ProfileStatsView: (data) {
      final args = data.getArgs<ProfileStatsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ProfileStatsView(
            key: args.key, type: args.type, event: args.event),
        settings: data,
      );
    },
    _i2.GuestsView: (data) {
      final args = data.getArgs<GuestsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.GuestsView(key: args.key, event: args.event),
        settings: data,
      );
    },
    _i2.CreateEventView: (data) {
      final args = data.getArgs<CreateEventViewArguments>(
        orElse: () => const CreateEventViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.CreateEventView(
            key: args.key, editing: args.editing, event: args.event),
        settings: data,
      );
    },
    _i2.MapView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.MapView(),
        settings: data,
      );
    },
    _i2.UserProfileView: (data) {
      final args = data.getArgs<UserProfileViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.UserProfileView(
            key: args.key, userId: args.userId, event: args.event),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.AboutView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.AboutView(),
        settings: data,
      );
    },
    _i6.MoreEventsView: (data) {
      final args = data.getArgs<MoreEventsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.MoreEventsView(key: args.key, listType: args.listType),
        settings: data,
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

  final _i7.Key? key;

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

  final _i7.Key? key;

  final _i8.Event event;

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

  final _i7.Key? key;

  final _i9.StatsType type;

  final _i8.Event? event;

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

  final _i7.Key? key;

  final _i8.Event event;

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

  final _i7.Key? key;

  final bool editing;

  final _i8.Event? event;

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

  final _i7.Key? key;

  final String userId;

  final _i8.Event? event;

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

class MoreEventsViewArguments {
  const MoreEventsViewArguments({
    this.key,
    required this.listType,
  });

  final _i7.Key? key;

  final _i10.EventsListType listType;

  @override
  String toString() {
    return '{"key": "$key", "listType": "$listType"}';
  }

  @override
  bool operator ==(covariant MoreEventsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.listType == listType;
  }

  @override
  int get hashCode {
    return key.hashCode ^ listType.hashCode;
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
      page: _i5.AboutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i2.EventsView: (data) {
      final args = data.getArgs<NestedEventsViewArguments>(
        orElse: () => const NestedEventsViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.EventsView(
            key: args.key, fromProfileView: args.fromProfileView),
        settings: data,
      );
    },
    _i2.ChatView: (data) {
      final args = data.getArgs<NestedChatViewArguments>(
        orElse: () => const NestedChatViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ChatView(key: args.key),
        settings: data,
      );
    },
    _i2.ProfileView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ProfileView(),
        settings: data,
      );
    },
    _i2.AccountView: (data) {
      final args = data.getArgs<NestedAccountViewArguments>(
        orElse: () => const NestedAccountViewArguments(),
      );
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.AccountView(key: args.key),
        settings: data,
      );
    },
    _i2.EventDetailsView: (data) {
      final args = data.getArgs<NestedEventDetailsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.EventDetailsView(
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
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.CreateEventView(
            key: args.key, editing: args.editing, event: args.event),
        settings: data,
      );
    },
    _i2.ProfileStatsView: (data) {
      final args = data.getArgs<NestedProfileStatsViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.ProfileStatsView(
            key: args.key, type: args.type, event: args.event),
        settings: data,
      );
    },
    _i5.AboutView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.AboutView(),
        settings: data,
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

  final _i7.Key? key;

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

  final _i7.Key? key;

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

  final _i7.Key? key;

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

  final _i7.Key? key;

  final _i8.Event event;

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

  final _i7.Key? key;

  final bool editing;

  final _i8.Event? event;

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

  final _i7.Key? key;

  final _i9.StatsType type;

  final _i8.Event? event;

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

extension NavigatorStateExtension on _i11.NavigationService {
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
    _i7.Key? key,
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
    _i7.Key? key,
    required _i8.Event event,
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
    _i7.Key? key,
    required _i9.StatsType type,
    _i8.Event? event,
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
    _i7.Key? key,
    required _i8.Event event,
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
    _i7.Key? key,
    bool editing = false,
    _i8.Event? event,
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
    _i7.Key? key,
    required String userId,
    _i8.Event? event,
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

  Future<dynamic> navigateToMoreEventsView({
    _i7.Key? key,
    required _i10.EventsListType listType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.moreEventsView,
        arguments: MoreEventsViewArguments(key: key, listType: listType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

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
    _i7.Key? key,
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
    _i7.Key? key,
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
    _i7.Key? key,
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
    _i7.Key? key,
    required _i8.Event event,
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
    _i7.Key? key,
    bool editing = false,
    _i8.Event? event,
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
    _i7.Key? key,
    required _i9.StatsType type,
    _i8.Event? event,
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
    _i7.Key? key,
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
    _i7.Key? key,
    required _i8.Event event,
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
    _i7.Key? key,
    required _i9.StatsType type,
    _i8.Event? event,
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
    _i7.Key? key,
    required _i8.Event event,
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
    _i7.Key? key,
    bool editing = false,
    _i8.Event? event,
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
    _i7.Key? key,
    required String userId,
    _i8.Event? event,
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

  Future<dynamic> replaceWithMoreEventsView({
    _i7.Key? key,
    required _i10.EventsListType listType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.moreEventsView,
        arguments: MoreEventsViewArguments(key: key, listType: listType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

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
    _i7.Key? key,
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
    _i7.Key? key,
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
    _i7.Key? key,
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
    _i7.Key? key,
    required _i8.Event event,
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
    _i7.Key? key,
    bool editing = false,
    _i8.Event? event,
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
    _i7.Key? key,
    required _i9.StatsType type,
    _i8.Event? event,
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
