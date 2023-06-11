import 'package:dio/dio.dart';
import 'package:plansteria/models/place_suggestion.dart';
import 'package:retrofit/retrofit.dart';

part 'google_map_client.g.dart';

/// Retrofit REST API client for GoogleMap service.
@RestApi()
abstract class GoogleMapClient {
  /// Creates an instance of [GoogleMapClient].
  factory GoogleMapClient(Dio dio, {String baseUrl}) = _GoogleMapClient;

  @POST("/place/autocomplete/json")
  Future<List<PlaceSuggestion>> fetchPlaces({
    @Query('input') required String input,
    @Query('types') String types = 'geocode',
  });
}


