// ignore_for_file: sdk_version_since

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/core/errors/event_error.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/models/user.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

import 'auth_service.dart';
import 'network_service.dart';

final now = DateTime.now();
final today = now.copyWith(hour: 0, minute: 0, second: 0);

class EventService with ListenableServiceMixin {
  final _events = ReactiveValue<List<Event?>>([]);

  final _networkService = locator<NetworkService>();
  final _authService = locator<AuthService>();

  EventService() {
    listenToReactiveValues([_events]);
  }

  List<Event?> get events => _events.value;

  Stream<List<Event?>> get upcomingEventsStream {
    return eventsRef
        .whereDate(isGreaterThanOrEqualTo: today)
        .limit(3)
        .snapshots()
        .map((e) => e.docs.map((d) => d.data).toList());
  }

  Stream<List<Event?>> get eventsByUsersFollowingStream async* {
    final followingRef = userRef.doc(_authService.currentUser!.uid).following;
    final allFollowing = await followingRef.get().then((value) {
      return value.docs.map((e) => e.data.uid).toList();
    });
    yield* eventsRef
        .whereCreatorId(whereIn: allFollowing)
        .snapshots()
        .map((e) => e.docs.map((d) => d.data).toList());
  }

  Stream<int> numberOfAllCreatedEvents(String creatorId) {
    return eventsRef
        .whereCreatorId(isEqualTo: creatorId)
        .snapshots()
        .map((event) => event.docs.length);
  }

  Stream<Event?> get featuredEventStream {
    return eventsRef.orderByNumberOfGuests(descending: true).snapshots().map(
          (e) => e.docs
              .map((d) => d.data)
              .where((e) =>
                  e.photoUrls.isNotEmpty &&
                  e.date.microsecondsSinceEpoch >= today.microsecondsSinceEpoch)
              .toList()
              .first,
        );
  }

  Stream<List<Guest?>> guestsStream(String eventId) {
    GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
    return guestsRef.snapshots().map((e) => e.docs.map((d) => d.data).toList());
  }

  Future<List<Event?>> getUpcomingEvents() async {
    final query =
        await eventsRef.whereDate(isGreaterThanOrEqualTo: today).get();
    return query.docs.map((e) => e.data).toList();
  }

  Future<List<Guest?>> getAllGuests(String eventId) async {
    GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
    final query = await guestsRef.get();
    return query.docs.map((e) => e.data).toList();
  }

  Stream<int> numberOfGuestsStream(String eventId) {
    GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
    return guestsRef.snapshots().map((event) => event.docs.length);
  }

  Stream<Event> eventStream(String eventId) {
    return eventsRef.doc(eventId).snapshots().map((event) => event.data!);
  }

  Stream<bool> isAttendingStream(String eventId, String guestId) {
    GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
    return guestsRef.doc(guestId).snapshots().map((event) => event.exists);
  }

  Stream<List<Event?>> myEventsStream(String creatorId) {
    return eventsRef
        .whereCreatorId(isEqualTo: creatorId)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data).toList());
  }

  Future<Either<EventError, Unit>> addGuest(String eventId, Guest guest) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      final doc = eventsRef.doc(eventId);
      await doc.update(guestIdsFieldValue: FieldValue.arrayUnion([guest.uid]));
      await doc.guests.doc(guest.uid).set(guest);
      final numberOfGuests = (await doc.guests.get()).docs.length;
      await doc.update(numberOfGuests: numberOfGuests);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
    }
  }

  Future<Either<EventError, Unit>> removeGuest(
    String eventId,
    String guestId,
  ) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      final doc = eventsRef.doc(eventId);
      await doc.update(guestIdsFieldValue: FieldValue.arrayRemove([guestId]));
      await doc.guests.doc(guestId).delete();
      final numberOfGuests = (await doc.guests.get()).docs.length;
      await doc.update(numberOfGuests: numberOfGuests);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
    }
  }

  Future<List<Guest?>> allGuests(String eventId) async {
    try {
      GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
      final query = await guestsRef.get();
      return query.docs.map((e) => e.data).toList();
    } catch (e) {
      // print('object');
      return [];
    }
  }

  Future<int> getNumberOfGuests(String eventId) async {
    try {
      GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
      final query = await guestsRef.get();
      return query.docs.length;
    } catch (e) {
      // print('object');
      return 0;
    }
  }

  Future<Either<EventError, Unit>> createEvent(Event event) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      await eventsRef.doc(event.uid).set(event);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
    }
  }

  Future<Either<EventError, Unit>> deleteEvent(String eventId) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      await eventsRef.doc(eventId).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
    }
  }

  Future<Either<EventError, List<Event?>>> getAllEvents() async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      final query = await eventsRef.get();
      final result = query.docs.map((e) => e.data).toList();
      _events.value = result;
      return right(result);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
    }
  }

  Future<Event> getEvent(String eventId) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return throw Exception(kNoNetworkConnectionError);
    }

    try {
      final query = await eventsRef.doc(eventId).get();
      final result = query.snapshot.data();
      return result!;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<Event?>> getEvents() async {
    final s = await eventsRef.get();
    final newS = s.docs.map((e) => e.data).toList();
    return newS;
  }

  Future<List<Guest?>> getEventGuests(String eventId) async {
    GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
    final resultSnapshot = await guestsRef.get();
    return resultSnapshot.docs.map((e) => e.data).toList();
  }

  Future<bool> isAttending(String eventId, String guestId) async {
    GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
    final resultSnapshot = await guestsRef.doc(guestId).get();
    return resultSnapshot.exists;
  }

  Future<Event> getFeaturedEvent() async {
    final query = await eventsRef.orderByNumberOfGuests(descending: true).get();
    return query.docs
        .map((e) => e.data)
        .where((e) => e.eventImageUrl != null)
        .first;
  }

  Future<List<Event?>> getMyEvents(String creatorId, [int? limit]) async {
    // if (_networkService.status == NetworkStatus.disconnected) {
    //   return left(const EventError.networkError());
    // }
    late EventQuerySnapshot query;
    if (limit != null) {
      query = await eventsRef
          .whereCreatorId(isEqualTo: creatorId)
          .limit(limit)
          .get();
    } else {
      query = await eventsRef.whereCreatorId(isEqualTo: creatorId).get();
    }

    try {
      final result = query.docs.map((e) => e.data).toList();
      _events.value = result;
      return result;
    } on FirebaseException catch (e) {
      return throw (EventError.error(e.message));
    } on Exception {
      return throw (const EventError.serverError());
    }
  }

  Future<List<Event?>> getMyAttendingEvents(String userId, [int? limit]) async {
    late EventQuerySnapshot query;
    if (limit != null) {
      query = await eventsRef
          .whereGuestIds(arrayContains: userId)
          .limit(limit)
          .get();
    } else {
      query = await eventsRef.whereGuestIds(arrayContains: userId).get();
    }
    try {
      final result = query.docs
          .map((e) => e.data)
          .where((e) => e.date.isAfter(today))
          .toList();
      _events.value = result;
      return result;
    } on FirebaseException catch (e) {
      return throw (EventError.error(e.message));
    } on Exception {
      return throw (const EventError.serverError());
    }
  }

  Future<List<Event?>> getMyAttendedEvents(String userId, [int? limit]) async {
    late EventQuerySnapshot query;
    if (limit != null) {
      query = await eventsRef
          .whereGuestIds(arrayContains: userId)
          .limit(limit)
          .get();
    } else {
      query = await eventsRef.whereGuestIds(arrayContains: userId).get();
    }
    try {
      final result = query.docs
          .map((e) => e.data)
          .where((e) => e.date.isBefore(today))
          .toList();
      _events.value = result;
      return result;
    } on FirebaseException catch (e) {
      return throw (EventError.error(e.message));
    } on Exception {
      return throw (const EventError.serverError());
    }
  }

  Future<Either<EventError, Unit>> removeEvent(String uid) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      await eventsRef.doc(uid).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
    }
  }

  Future<Either<EventError, Unit>> updateEvent(Event event) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      await eventsRef.doc(event.uid).set(event);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
    }
  }
}
