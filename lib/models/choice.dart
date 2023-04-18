import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'choice.freezed.dart';
part 'choice.g.dart';

@freezed
@JsonSerializable(createFactory: false)
class Choice with _$Choice {
  const factory Choice({
    Message? message,
    String? finishReason,
    int? index,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
