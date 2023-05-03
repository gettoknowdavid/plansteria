// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
@JsonSerializable(createFactory: false, includeIfNull: false)
class Message with _$Message {
  const factory Message({
    required String role,
    required String content,
    String? name,
    @JsonKey(includeToJson: false) DateTime? created,
    @JsonKey(includeToJson: false) bool? hasAnimated,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
