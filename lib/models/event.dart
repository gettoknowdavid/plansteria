// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

const _$$_EventFieldMap = <String, String>{
  'uid': 'uid',
  'eventName': 'eventName',
  'description': 'description',
  'eventAddress': 'eventAddress',
  'notes': 'notes',
  'price': 'price',
  'date': 'date',
  'startTime': 'startTime',
  'endTime': 'endTime',
  'eventImageUrl': 'eventImageUrl',
  'creatorId': 'creatorId',
  'createdName': 'createdName',
  'creatorAvatar': 'creatorAvatar',
};

final eventsRef = EventCollectionReference();

@Collection<Event>('events')
@freezed
@JsonSerializable(createFactory: false)
class Event with _$Event {
  factory Event({
    required String uid,
    required String eventName,
    String? description,
    required String eventAddress,
    String? notes,
    double? price,
    required DateTime date,
    required DateTime startTime,
    DateTime? endTime,
    String? eventImageUrl,
    required String creatorId,
    required String createdName,
    String? creatorAvatar,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
