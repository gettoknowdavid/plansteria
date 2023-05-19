// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i4.RegisterView,
    ),
    _i1.RouteDef(
      Routes.verificationView,
      page: _i5.VerificationView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i6.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.confirmationView,
      page: _i7.ConfirmationView,
    ),
    _i1.RouteDef(
      Routes.layoutView,
      page: _i8.LayoutView,
    ),
    _i1.RouteDef(
      Routes.eventDetailsView,
      page: _i9.EventDetailsView,
    ),
    _i1.RouteDef(
      Routes.profileStatsView,
      page: _i10.ProfileStatsView,
    ),
    _i1.RouteDef(
      Routes.guestsView,
      page: _i11.GuestsView,
    ),
    _i1.RouteDef(
      Routes.createEventView,
      page: _i12.CreateEventView,
    ),
    _i1.RouteDef(
      Routes.mapView,
      page: _i13.MapView,
    ),
    _i1.RouteDef(
      Routes.userProfileView,
      page: _i14.UserProfileView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i15.OnboardingView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.LoginView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.RegisterView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.RegisterView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.VerificationView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.VerificationView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.ForgotPasswordView: (data) {
      final args = data.getArgs<ForgotPasswordViewArguments>(
        orElse: () => const ForgotPasswordViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ForgotPasswordView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i7.ConfirmationView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ConfirmationView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.LayoutView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.LayoutView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.EventDetailsView: (data) {
      final args = data.getArgs<EventDetailsViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.EventDetailsView(
            key: args.key,
            event: args.event,
            isFromLayoutView: args.isFromLayoutView),
        settings: data,
        maintainState: false,
      );
    },
    _i10.ProfileStatsView: (data) {
      final args = data.getArgs<ProfileStatsViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ProfileStatsView(
            key: args.key, type: args.type, event: args.event),
        settings: data,
        maintainState: false,
      );
    },
    _i11.GuestsView: (data) {
      final args = data.getArgs<GuestsViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.GuestsView(key: args.key, event: args.event),
        settings: data,
        maintainState: false,
      );
    },
    _i12.CreateEventView: (data) {
      final args = data.getArgs<CreateEventViewArguments>(
        orElse: () => const CreateEventViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.CreateEventView(
            key: args.key, editing: args.editing, event: args.event),
        settings: data,
        maintainState: false,
      );
    },
    _i13.MapView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.MapView(),
        settings: data,
        maintainState: false,
      );
    },
    _i14.UserProfileView: (data) {
      final args = data.getArgs<UserProfileViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.UserProfileView(
            key: args.key, userId: args.userId, event: args.event),
        settings: data,
        maintainState: false,
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

  final _i16.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class EventDetailsViewArguments {
  const EventDetailsViewArguments({
    this.key,
    required this.event,
    this.isFromLayoutView = false,
  });

  final _i16.Key? key;

  final _i17.Event event;

  final bool isFromLayoutView;

  @override
  String toString() {
    return '{"key": "$key", "event": "$event", "isFromLayoutView": "$isFromLayoutView"}';
  }
}

class ProfileStatsViewArguments {
  const ProfileStatsViewArguments({
    this.key,
    required this.type,
    this.event,
  });

  final _i16.Key? key;

  final _i18.StatsType type;

  final _i17.Event? event;

  @override
  String toString() {
    return '{"key": "$key", "type": "$type", "event": "$event"}';
  }
}

class GuestsViewArguments {
  const GuestsViewArguments({
    this.key,
    required this.event,
  });

  final _i16.Key? key;

  final _i17.Event event;

  @override
  String toString() {
    return '{"key": "$key", "event": "$event"}';
  }
}

class CreateEventViewArguments {
  const CreateEventViewArguments({
    this.key,
    this.editing = false,
    this.event,
  });

  final _i16.Key? key;

  final bool editing;

  final _i17.Event? event;

  @override
  String toString() {
    return '{"key": "$key", "editing": "$editing", "event": "$event"}';
  }
}

class UserProfileViewArguments {
  const UserProfileViewArguments({
    this.key,
    required this.userId,
    this.event,
  });

  final _i16.Key? key;

  final String userId;

  final _i17.Event? event;

  @override
  String toString() {
    return '{"key": "$key", "userId": "$userId", "event": "$event"}';
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
    ),
    _i1.RouteDef(
      LayoutViewRoutes.eventDetailsView,
      page: _i9.EventDetailsView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.createEventView,
      page: _i12.CreateEventView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.profileStatsView,
      page: _i10.ProfileStatsView,
    ),
    _i1.RouteDef(
      LayoutViewRoutes.aboutView,
      page: _i24.AboutView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i19.HomeView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.HomeView(),
        settings: data,
        maintainState: false,
      );
    },
    _i20.EventsView: (data) {
      final args = data.getArgs<NestedEventsViewArguments>(
        orElse: () => const NestedEventsViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.EventsView(
            key: args.key, fromProfileView: args.fromProfileView),
        settings: data,
        maintainState: false,
      );
    },
    _i21.ChatView: (data) {
      final args = data.getArgs<NestedChatViewArguments>(
        orElse: () => const NestedChatViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.ChatView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i22.ProfileView: (data) {
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.ProfileView(),
        settings: data,
        maintainState: false,
      );
    },
    _i23.AccountView: (data) {
      final args = data.getArgs<NestedAccountViewArguments>(
        orElse: () => const NestedAccountViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.AccountView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i9.EventDetailsView: (data) {
      final args = data.getArgs<NestedEventDetailsViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.EventDetailsView(
            key: args.key,
            event: args.event,
            isFromLayoutView: args.isFromLayoutView),
        settings: data,
        maintainState: false,
      );
    },
    _i12.CreateEventView: (data) {
      final args = data.getArgs<NestedCreateEventViewArguments>(
        orElse: () => const NestedCreateEventViewArguments(),
      );
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.CreateEventView(
            key: args.key, editing: args.editing, event: args.event),
        settings: data,
        maintainState: false,
      );
    },
    _i10.ProfileStatsView: (data) {
      final args = data.getArgs<NestedProfileStatsViewArguments>(nullOk: false);
      return _i16.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ProfileStatsView(
            key: args.key, type: args.type, event: args.event),
        settings: data,
        maintainState: false,
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

  final _i16.Key? key;

  final bool fromProfileView;

  @override
  String toString() {
    return '{"key": "$key", "fromProfileView": "$fromProfileView"}';
  }
}

class NestedChatViewArguments {
  const NestedChatViewArguments({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class NestedAccountViewArguments {
  const NestedAccountViewArguments({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class NestedEventDetailsViewArguments {
  const NestedEventDetailsViewArguments({
    this.key,
    required this.event,
    this.isFromLayoutView = false,
  });

  final _i16.Key? key;

  final _i17.Event event;

  final bool isFromLayoutView;

  @override
  String toString() {
    return '{"key": "$key", "event": "$event", "isFromLayoutView": "$isFromLayoutView"}';
  }
}

class NestedCreateEventViewArguments {
  const NestedCreateEventViewArguments({
    this.key,
    this.editing = false,
    this.event,
  });

  final _i16.Key? key;

  final bool editing;

  final _i17.Event? event;

  @override
  String toString() {
    return '{"key": "$key", "editing": "$editing", "event": "$event"}';
  }
}

class NestedProfileStatsViewArguments {
  const NestedProfileStatsViewArguments({
    this.key,
    required this.type,
    this.event,
  });

  final _i16.Key? key;

  final _i18.StatsType type;

  final _i17.Event? event;

  @override
  String toString() {
    return '{"key": "$key", "type": "$type", "event": "$event"}';
  }
}

extension NavigatorStateExtension on _i25.NavigationService {
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
    _i16.Key? key,
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
    _i16.Key? key,
    required _i17.Event event,
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
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
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
    _i16.Key? key,
    required _i17.Event event,
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
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
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
    _i16.Key? key,
    required String userId,
    _i17.Event? event,
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
    _i16.Key? key,
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
    _i16.Key? key,
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
    _i16.Key? key,
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
    _i16.Key? key,
    required _i17.Event event,
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
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
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
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
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
    _i16.Key? key,
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
    _i16.Key? key,
    required _i17.Event event,
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
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
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
    _i16.Key? key,
    required _i17.Event event,
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
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
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
    _i16.Key? key,
    required String userId,
    _i17.Event? event,
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
    _i16.Key? key,
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
    _i16.Key? key,
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
    _i16.Key? key,
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
    _i16.Key? key,
    required _i17.Event event,
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
    _i16.Key? key,
    bool editing = false,
    _i17.Event? event,
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
    _i16.Key? key,
    required _i18.StatsType type,
    _i17.Event? event,
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
