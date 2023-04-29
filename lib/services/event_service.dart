import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/core/errors/event_error.dart';
import 'package:plansteria/models/event.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

import 'network_service.dart';

class EventService with ListenableServiceMixin {
  final _events = ReactiveValue<List<Event?>>([]);

  final _networkService = locator<NetworkService>();

  EventService() {
    listenToReactiveValues([_events]);
  }

  List<Event?> get events => _events.value;

  Stream<List<Event?>> get eventsStream {
    return eventsRef.snapshots().map((e) => e.docs.map((d) => d.data).toList());
  }

  Future<Either<EventError, Unit>> addGuest(String eventId, Guest guest) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
      await guestsRef.doc(guest.uid).set(guest);
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
      GuestCollectionReference guestsRef = eventsRef.doc(eventId).guests;
      await guestsRef.doc(guestId).delete();
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

  Future<Either<EventError, List<Event?>>> getMyEvents(String creatorId) async {
    if (_networkService.status == NetworkStatus.disconnected) {
      return left(const EventError.networkError());
    }

    try {
      final query = await eventsRef.whereCreatorId(isEqualTo: creatorId).get();
      final result = query.docs.map((e) => e.data).toList();
      _events.value = result;
      return right(result);
    } on FirebaseException catch (e) {
      return left(EventError.error(e.message));
    } on Exception {
      return left(const EventError.serverError());
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
