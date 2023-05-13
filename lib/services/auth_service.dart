import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/core/errors/auth_error.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/services/network_service.dart';
import 'package:plansteria/services/secure_storage_service.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class AuthService with ListenableServiceMixin {
  final fb.FirebaseAuth _firebaseAuth = fb.FirebaseAuth.instance;
  final _networkService = locator<NetworkService>();
  final _secureStorageService = locator<SecureStorageService>();

  final _isAuthenticated = ReactiveValue<bool>(false);

  final _isEmailVerified = ReactiveValue<bool?>(null);

  final _currentUser = ReactiveValue<User?>(null);

  AuthService() {
    listenToReactiveValues([_isAuthenticated, _isEmailVerified, _currentUser]);
  }

  User? get currentUser => _currentUser.value;
  bool get isAuthenticated => _isAuthenticated.value;
  bool? get isEmailVerified => _isEmailVerified.value;

  Stream<User> userByIdStream(String userId) {
    return userRef.doc(userId).snapshots().map((user) => user.data!);
  }

  Future<User> getUserById(String userId) async {
    final snapshot = await userRef.doc(userId).get();
    return snapshot.data!;
  }

  Future<void> getAuthUser() async {
    final snapshot = await userRef.doc(currentUser!.uid).get();
    _currentUser.value = snapshot.data!;
    await _secureStorageService.write(
      key: kAuthUser,
      value: jsonEncode(_currentUser.value?.toJson()),
    );
    notifyListeners();
  }

  Future<void> checkAuthenticated() async {
    final firebaseUser = _firebaseAuth.currentUser;

    final localUserString = await _secureStorageService.read(kAuthUser);

    if (firebaseUser == null && localUserString == null) {
      _isAuthenticated.value = false;
      notifyListeners();
    }

    if (firebaseUser != null || localUserString != null) {
      _isAuthenticated.value = true;
      final snapshot = await userRef.doc(firebaseUser!.uid).get();
      _currentUser.value = snapshot.data;
      notifyListeners();
    }
  }

  Future<Option<Either<AuthError, bool>>> checkEmailVerified() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      final localUserString = await _secureStorageService.read(kAuthUser);

      if (localUserString == null) {
        return optionOf(null);
      }

      final localUser = User.fromJson(jsonDecode(localUserString));

      _isEmailVerified.value = localUser.emailVerified;
      return optionOf(right(localUser.emailVerified));
    }

    final firebaseUser = _firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return optionOf(null);
    }

    await firebaseUser.reload();

    if (firebaseUser.emailVerified) {
      _isEmailVerified.value = true;

      return optionOf(right(true));
    } else {
      return optionOf(left(const AuthError.notVerified()));
    }
  }

  Future<Either<AuthError, Unit>> forgotPassword(String email) async {
    try {
      // Send password reset email using Firebase authentication.
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'user-not-found':
          return left(const AuthError.userNotFound());
        case 'invalid-email':
          return left(const AuthError.invalidEmail());
        default:
          return left(const AuthError.serverError());
      }
    }
  }

  Future<Either<AuthError, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = result.user!;

      final snapshot = await userRef.doc(firebaseUser.uid).get();

      final user = snapshot.data;

      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(user?.toJson()),
      );

      _currentUser.value = user;
      _isAuthenticated.value = true;

      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'wrong-password':
        case 'user-not-found':
          return left(const AuthError.invalidEmailOrPassword());
        default:
          return left(const AuthError.serverError());
      }
    }
  }

  /// Logs the user out by deleting their data from storage and signing them out
  Future<void> logout() async {
    try {
      // Wait for both the storage and authentication operations to complete
      await Future.wait([
        _secureStorageService.deleteAll(),
        _firebaseAuth.signOut(),
      ]);
      _currentUser.value = null;
      _isAuthenticated.value = false;
      notifyListeners();
    } catch (e) {
      // Log any errors that occur during the logout process
      // print('Error logging out: $e');
    }
  }

  Future<Either<AuthError, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = result.user!;

      await _firebaseAuth.currentUser!.updateDisplayName(name);

      final user = User(
        uid: firebaseUser.uid,
        name: name,
        email: email,
        emailVerified: false,
      );

      await userRef.doc(firebaseUser.uid).set(user);

      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(user.toJson()),
      );

      _currentUser.value = user;
      _isAuthenticated.value = true;

      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      if (e.code == 'email-already-in-use') {
        return left(const AuthError.emailInUse());
      } else {
        return left(const AuthError.serverError());
      }
    }
  }

  Future<Either<AuthError, Unit>> sendVerificationEmail() async {
    try {
      // Sends the verification email to the current user's email address
      await _firebaseAuth.currentUser!.sendEmailVerification();
      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // If the user is not logged in, return an authentication error
      if (e.code == 'user-mismatch') {
        return left(const AuthError.userNotFound());
      } else {
        // Otherwise, return a server error
        return left(const AuthError.serverError());
      }
    }
  }

  Future<Either<AuthError, Unit>> updateProfile(User u) async {
    final id = _firebaseAuth.currentUser!.uid;

    try {
      userRef.doc(id).set(u);

      final updatedUserSnapshot = await userRef.doc(id).get();
      final updatedUser = updatedUserSnapshot.data;

      await _secureStorageService.write(
        key: kAuthUser,
        value: jsonEncode(updatedUser?.toJson()),
      );

      _currentUser.value = updatedUser;

      notifyListeners();

      return right(unit);
    } on fb.FirebaseAuthException {
      return left(const AuthError.serverError());
    }
  }

  Future<Either<AuthError, Unit>> updateEmailAddress(String newEmail) async {
    final curUser = _firebaseAuth.currentUser!;

    try {
      await curUser.updateEmail(newEmail);
      await userRef.doc(curUser.uid).update(email: newEmail);
      return right(unit);
    } on fb.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      if (e.code == 'email-already-in-use') {
        return left(const AuthError.emailInUse());
      } else if (e.code == 'requires-recent-login') {
        return left(const AuthError.requiresRecentLogin());
      } else {
        return left(AuthError.error(e.message));
      }
    }
  }

  Future<Either<AuthError, Unit>> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final curUser = _firebaseAuth.currentUser!;

    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: curUser.email!,
      password: oldPassword,
    );

    if (result.user != null && result.user?.uid == curUser.uid) {
      await curUser.updatePassword(newPassword);
    } else {
      return left(const AuthError.invalidPassword());
    }

    try {
      await curUser.updatePassword(newPassword);
      return right(unit);
    } on fb.FirebaseAuthException {
      return left(const AuthError.serverError());
    }
  }
}
