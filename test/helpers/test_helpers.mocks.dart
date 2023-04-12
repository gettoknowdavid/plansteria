// Mocks generated by Mockito 5.4.0 from annotations
// in plansteria/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;
import 'dart:ui' as _i6;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter/material.dart' as _i5;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:plansteria/core/errors/auth_error.dart' as _i8;
import 'package:plansteria/services/auth_service.dart' as _i7;
import 'package:plansteria/services/event_service.dart' as _i13;
import 'package:plansteria/services/network_service.dart' as _i10;
import 'package:plansteria/services/open_mail_app_service.dart' as _i12;
import 'package:plansteria/services/secure_storage_service.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeOption_0<A> extends _i1.SmartFake implements _i2.Option<A> {
  _FakeOption_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamSubscription_2<T> extends _i1.SmartFake
    implements _i3.StreamSubscription<T> {
  _FakeStreamSubscription_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i4.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i5.GlobalKey<_i5.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i5.GlobalKey<_i5.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i4.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<T?>? navigateWithTransition<T>(
    _i5.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i5.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? replaceWithTransition<T>(
    _i5.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i5.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i4.Transition? transitionClass,
    _i4.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i5.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i5.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? navigateToView<T>(
    _i5.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i5.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i4.Transition? transition,
    _i4.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i5.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? clearStackAndShowView<T>(
    _i5.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? clearTillFirstAndShowView<T>(
    _i5.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
  @override
  _i3.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i5.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i3.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i4.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i4.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<_i4.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i3.Future<_i4.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i3.Future<_i4.SheetResponse<dynamic>?>.value(),
      ) as _i3.Future<_i4.SheetResponse<dynamic>?>);
  @override
  _i3.Future<_i4.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i6.Color? barrierColor = const _i6.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i3.Future<_i4.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.SheetResponse<T>?>.value(),
      ) as _i3.Future<_i4.SheetResponse<T>?>);
  @override
  void completeSheet(_i4.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i4.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i4.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i5.Widget Function(
      _i5.BuildContext,
      _i4.DialogRequest<dynamic>,
      dynamic Function(_i4.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Future<_i4.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i6.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i6.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i3.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i3.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i3.Future<_i4.DialogResponse<dynamic>?>);
  @override
  _i3.Future<_i4.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i6.Color? barrierColor = const _i6.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i3.Future<_i4.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.DialogResponse<T>?>.value(),
      ) as _i3.Future<_i4.DialogResponse<T>?>);
  @override
  _i3.Future<_i4.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    String? confirmationTitle = r'Ok',
    bool? barrierDismissible = false,
    _i4.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #confirmationTitle: confirmationTitle,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i3.Future<_i4.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i3.Future<_i4.DialogResponse<dynamic>?>.value(),
      ) as _i3.Future<_i4.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i4.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i7.AuthService {
  @override
  bool get isAuthenticated => (super.noSuchMethod(
        Invocation.getter(#isAuthenticated),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i3.Future<void> checkAuthenticated() => (super.noSuchMethod(
        Invocation.method(
          #checkAuthenticated,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<_i2.Option<_i2.Either<_i8.AuthError, bool>>>
      checkEmailVerified() => (super.noSuchMethod(
            Invocation.method(
              #checkEmailVerified,
              [],
            ),
            returnValue:
                _i3.Future<_i2.Option<_i2.Either<_i8.AuthError, bool>>>.value(
                    _FakeOption_0<_i2.Either<_i8.AuthError, bool>>(
              this,
              Invocation.method(
                #checkEmailVerified,
                [],
              ),
            )),
            returnValueForMissingStub:
                _i3.Future<_i2.Option<_i2.Either<_i8.AuthError, bool>>>.value(
                    _FakeOption_0<_i2.Either<_i8.AuthError, bool>>(
              this,
              Invocation.method(
                #checkEmailVerified,
                [],
              ),
            )),
          ) as _i3.Future<_i2.Option<_i2.Either<_i8.AuthError, bool>>>);
  @override
  _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>> forgotPassword(
          String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #forgotPassword,
          [email],
        ),
        returnValue: _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
            _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #forgotPassword,
            [email],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
                _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #forgotPassword,
            [email],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>);
  @override
  _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>> login({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
            _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #login,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
                _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #login,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>);
  @override
  _i3.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>> register({
    required String? name,
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [],
          {
            #name: name,
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
            _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #register,
            [],
            {
              #name: name,
              #email: email,
              #password: password,
            },
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
                _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #register,
            [],
            {
              #name: name,
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>);
  @override
  _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>> sendVerificationEmail() =>
      (super.noSuchMethod(
        Invocation.method(
          #sendVerificationEmail,
          [],
        ),
        returnValue: _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
            _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #sendVerificationEmail,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>.value(
                _FakeEither_1<_i8.AuthError, _i2.Unit>(
          this,
          Invocation.method(
            #sendVerificationEmail,
            [],
          ),
        )),
      ) as _i3.Future<_i2.Either<_i8.AuthError, _i2.Unit>>);
  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SecureStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageService extends _i1.Mock
    implements _i9.SecureStorageService {
  @override
  _i3.Future<void> delete(String? key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<String?> read(String? key) => (super.noSuchMethod(
        Invocation.method(
          #read,
          [key],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
  @override
  _i3.Future<void> write({
    required String? key,
    required String? value,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [],
          {
            #key: key,
            #value: value,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [NetworkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkService extends _i1.Mock implements _i10.NetworkService {
  @override
  _i10.NetworkStatus get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _i10.NetworkStatus.connected,
        returnValueForMissingStub: _i10.NetworkStatus.connected,
      ) as _i10.NetworkStatus);
  @override
  int get listenersCount => (super.noSuchMethod(
        Invocation.getter(#listenersCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i3.Future<void> checkConnectivity() => (super.noSuchMethod(
        Invocation.method(
          #checkConnectivity,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.StreamSubscription<_i11.InternetConnectionStatus> listenForChange() =>
      (super.noSuchMethod(
        Invocation.method(
          #listenForChange,
          [],
        ),
        returnValue: _FakeStreamSubscription_2<_i11.InternetConnectionStatus>(
          this,
          Invocation.method(
            #listenForChange,
            [],
          ),
        ),
        returnValueForMissingStub:
            _FakeStreamSubscription_2<_i11.InternetConnectionStatus>(
          this,
          Invocation.method(
            #listenForChange,
            [],
          ),
        ),
      ) as _i3.StreamSubscription<_i11.InternetConnectionStatus>);
  @override
  void listenToReactiveValues(List<dynamic>? reactiveValues) =>
      super.noSuchMethod(
        Invocation.method(
          #listenToReactiveValues,
          [reactiveValues],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(void Function()? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [OpenMailAppService].
///
/// See the documentation for Mockito's code generation for more information.
class MockOpenMailAppService extends _i1.Mock
    implements _i12.OpenMailAppService {
  @override
  _i3.Future<void> openMailApp() => (super.noSuchMethod(
        Invocation.method(
          #openMailApp,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [EventService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventService extends _i1.Mock implements _i13.EventService {}
