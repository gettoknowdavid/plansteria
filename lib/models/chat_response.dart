import 'package:freezed_annotation/freezed_annotation.dart';

import 'choice.dart';
import 'usage.dart';

part 'chat_response.freezed.dart';
part 'chat_response.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    String? id,
    String? object,
    int? created,
    String? model,
    Usage? usage,
    List<Choice>? choices,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
