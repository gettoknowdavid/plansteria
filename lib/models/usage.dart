import 'package:freezed_annotation/freezed_annotation.dart';

part 'usage.freezed.dart';
part 'usage.g.dart';

@freezed
@JsonSerializable(createFactory: false)
class Usage with _$Usage {
  const factory Usage({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
  
  @override
  Map<String, dynamic> toJson() => _$UsageToJson(this);
}
