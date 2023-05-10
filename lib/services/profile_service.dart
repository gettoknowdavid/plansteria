import 'dart:io' show Platform;

import 'package:plansteria/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileService {
  Stream<int> followers(String userId) {
    final followersRef = userRef.doc(userId).followers;
    return followersRef.snapshots().map((event) => event.docs.length);
  }

  Stream<int> following(String userId) {
    final followingRef = userRef.doc(userId).following;
    return followingRef.snapshots().map((event) => event.docs.length);
  }

  Future<void> follow(User user, User userToFollow) async {
    try {
      FollowingCollectionReference followingRef =
          userRef.doc(user.uid).following;
      await followingRef.doc(userToFollow.uid).set(userToFollow);

      FollowersCollectionReference followersRef =
          userRef.doc(userToFollow.uid).followers;
      await followersRef.doc(user.uid).set(user);
      return;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> unFollow(User user, User userToUnFollow) async {
    try {
      FollowingCollectionReference followingRef =
          userRef.doc(user.uid).following;
      await followingRef.doc(userToUnFollow.uid).delete();

      FollowersCollectionReference followersRef =
          userRef.doc(userToUnFollow.uid).followers;
      await followersRef.doc(user.uid).delete();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<User?>> getAllFollowing(String userId) async {
    FollowingCollectionReference followingRef = userRef.doc(userId).following;
    final query = await followingRef.get();
    return query.docs.map((e) => e.data).toList();
  }

  Future<List<User?>> getAllFollowers(String userId) async {
    FollowersCollectionReference followersRef = userRef.doc(userId).followers;
    final query = await followersRef.get();
    return query.docs.map((e) => e.data).toList();
  }

  Stream<bool> isFollowing(String userId, String userIdToCheck) {
    FollowingCollectionReference followingRef = userRef.doc(userId).following;
    return followingRef.doc(userIdToCheck).snapshots().map((e) => e.exists);
  }

  Future<void> callPhoneNumber(String phone) async {
    try {
      String url = Platform.isIOS ? 'tel://$phone' : 'tel:$phone';
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> sendMail(String email) async {
    try {
      const subject = "Hi";
      Uri uri = Uri.parse('mailto:$email?subject=$subject');
      await launchUrl(uri);
    } catch (e) {
      throw Exception(e);
    }
  }
}
