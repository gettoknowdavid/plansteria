import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plansteria/models/message.dart';

part 'chat_input.freezed.dart';
part 'chat_input.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class ChatInput with _$ChatInput {
  const factory ChatInput({
    required String model,
    required List<Message> messages,
  }) = _ChatResponse;

  factory ChatInput.fromJson(Map<String, dynamic> json) =>
      _$ChatInputFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChatInputToJson(this);
}
