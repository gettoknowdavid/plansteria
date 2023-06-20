// ignore_for_file: constant_identifier_names, unused_element

import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'creator.freezed.dart';
part 'creator.g.dart';

const _$$_CreatorFieldMap = <String, String>{
  'uid': 'uid',
  'name': 'name',
  'avatar': 'avatar',
};

// final creatorsRef = CreatorCollectionReference();

// @Collection<Creator>('creators')
@freezed
@JsonSerializable(createFactory: false)
class Creator with _$Creator {
  factory Creator({
    required String uid,
    required String name,
    String? avatar,
  }) = _Creator;

  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  factory Creator.fromUser(User user) =>
      Creator(uid: user.uid, name: user.name, avatar: user.avatar);

  @override
  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}
