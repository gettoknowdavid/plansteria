import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// class TimestampConverter implements JsonConverter<DateTime, dynamic> {
//   const TimestampConverter();

//   @override
//   DateTime fromJson(dynamic json) {
//     return json.toDate();
//   }

//   @override
//   dynamic toJson(DateTime object) {
//     return Timestamp.fromDate(object);
//   }
// }

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
