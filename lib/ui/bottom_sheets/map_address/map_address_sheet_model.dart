import 'package:plansteria/core/client/dio_client.dart';
import 'package:plansteria/models/place.dart';
import 'package:plansteria/models/place_suggestion.dart';
import 'package:stacked/stacked.dart';

class MapAddressSheetModel extends FormViewModel {
  Future<Place?> getPlace(String placeId) async {
    final request = "/place/details/json?place_id=$placeId";
    try {
      final response = await googleMapDioClient().get(request);
      final result = response.data['result'];

      final Place place = Place(
        placeId: result['place_id'],
        name: result['formatted_address'],
        lat: result['geometry']['location']['lat'],
        lon: result['geometry']['location']['lng'],
        types: (result['types'] as List<dynamic>).map((e) => '$e').toList(),
      );

      return place;
    } catch (e) {
      throw Exception('Failed to fetch suggestion: $e');
    }
  }

  Future<List<PlaceSuggestion?>> autoComplete(String input) async {
    final request = '/place/autocomplete/json?input=$input&types=address';

    try {
      final response = await googleMapDioClient().get(request);
      final result = response.data;

      return result['predictions']
          .map<PlaceSuggestion>((p) => PlaceSuggestion(
              placeId: p['place_id'], description: p['description']))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch suggestion: $e');
    }
  }
}


// import 'package:plansteria/app/app.locator.dart';
// import 'package:plansteria/models/place_suggestion.dart';
// import 'package:plansteria/services/services.dart';
// import 'package:stacked/stacked.dart';

// class MapAddressSheetModel extends FormViewModel {
//   final _locationService = locator<LocationService>();

//   Future<void> getPlace(String placeId) {
//     return _locationService.getPlace(placeId);
//   }

//   Future<List<PlaceSuggestion?>> autoComplete(String input) {
//     return _locationService.autoComplete(input);
//   }
// }
