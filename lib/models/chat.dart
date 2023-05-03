// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
@JsonSerializable(createFactory: false, includeIfNull: false)
class Chat with _$Chat {
  const factory Chat({
    required String role,
    required String content,
    required DateTime created,
    required bool hasAnimated,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  factory Chat.fromRemote(Message message) => Chat(
        role: message.role,
        content: message.content,
        created: DateTime.now(),
        hasAnimated: false,
      );

  @override
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
