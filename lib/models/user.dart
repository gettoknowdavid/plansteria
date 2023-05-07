// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

const _$$_UserFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'email': 'email',
  'avatar': 'avatar',
  'verified': 'verified',
};

// const _$$_ProfileFieldMap = <String, String>{
//   'uid': 'uid',
//   'name': 'name',
//   'avatar': 'avatar',
// };

final userRef = UserCollectionReference();

@Collection<User>('users')
// @Collection<Profile>('users/*/followers', prefix: 'Followers')
// @Collection<Profile>('users/*/following', prefix: 'Following')
@Collection<User>('users/*/followers', prefix: 'Followers')
@Collection<User>('users/*/following', prefix: 'Following')
@freezed
@JsonSerializable(createFactory: false)
class User with _$User {
  const factory User({
    required String uid,
    required String name,
    required String email,
    required bool emailVerified,
    String? avatar,
    String? phone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

// @freezed
// @JsonSerializable(createFactory: false)
// class Profile with _$Profile {
//   factory Profile({
//     required String uid,
//     required String name,
//     String? avatar,
//   }) = _Guest;

//   factory Profile.fromJson(Map<String, dynamic> json) =>
//       _$ProfileFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$GuestToJson(this);
// }
