import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_suggestion.freezed.dart';
part 'place_suggestion.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class PlaceSuggestion with _$PlaceSuggestion {
  factory PlaceSuggestion({
    required String placeId,
    required String description,
  }) = _PlaceSuggestion;

  factory PlaceSuggestion.fromJson(Map<String, dynamic> json) =>
      _$PlaceSuggestionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlaceSuggestionToJson(this);
}
