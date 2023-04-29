// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

const _$$_EventFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'description': 'description',
  'address': 'address',
  'state': 'state',
  'city': 'city',
  'numberOfGuests': 'numberOfGuests',
  'notes': 'notes',
  'price': 'price',
  'date': 'date',
  'startTime': 'startTime',
  'endTime': 'endTime',
  'eventImageUrl': 'eventImageUrl',
  'creatorId': 'creatorId',
  'email': 'email',
  'phone': 'phone',
  'photoUrls': 'photoUrls',
};

const _$$_GuestFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'avatar': 'avatar',
};

final eventsRef = EventCollectionReference();

@Collection<Event>('events')
@Collection<Guest>('events/*/guests')
@freezed
@JsonSerializable(createFactory: false)
class Event with _$Event {
  factory Event({
    required String uid,
    required String name,
    String? description,
    required String address,
    required String state,
    required String city,
    int? numberOfGuests,
    String? notes,
    double? price,
    required DateTime date,
    required DateTime startTime,
    DateTime? endTime,
    String? eventImageUrl,
    required List<String?> photoUrls,
    required String creatorId,
    bool? featured,
    required String email,
    required String phone,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@freezed
@JsonSerializable(createFactory: false)
class Guest with _$Guest {
  factory Guest({
    required String uid,
    required String name,
    String? avatar,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
