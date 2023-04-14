import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/core/errors/event_error.dart';
import 'package:plansteria/models/event.dart';
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
