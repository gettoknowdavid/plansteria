// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage.freezed.dart';
part 'usage.g.dart';

@freezed
@JsonSerializable(createFactory: false)
class Usage with _$Usage {
  const factory Usage({
    @JsonKey(name: "prompt_tokens") int? promptTokens,
    @JsonKey(name: "completion_tokens") int? completionTokens,
    @JsonKey(name: "total_tokens") int? totalTokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UsageToJson(this);
}
