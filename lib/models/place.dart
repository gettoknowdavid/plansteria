import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class Place with _$Place {
  factory Place({
    required String placeId,
    String? country,
    String? state,
    String? city,
    String? countryISO,
    required String name,
    required double lat,
    required double lon,
    required List<String> types,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
