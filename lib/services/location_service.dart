import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plansteria/core/client/dio_client.dart';
import 'package:plansteria/models/place.dart';
import 'package:plansteria/models/place_suggestion.dart';
import 'package:plansteria/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class LocationService with ListenableServiceMixin {
  final _currentGeo = ReactiveValue<LatLng>(const LatLng(0.0, 0.0));
  final _currentAddress = ReactiveValue<String?>(null);
  final _placemark = ReactiveValue<Placemark?>(null);
  final _position = ReactiveValue<Position?>(null);

  final _place = ReactiveValue<Place?>(null);

  LocationService() {
    listenToReactiveValues([
      _currentGeo,
      _currentAddress,
      _placemark,
      _position,
      _place,
    ]);
  }

  String? get currentAddress => _currentAddress.value;
  LatLng get currentGeo => _currentGeo.value;
  Placemark? get placemark => _placemark.value;
  Position? get position => _position.value;

  Place? get place => _place.value;

  Future<void> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error(kLocationPermissionDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(kLocationPermissionPermanentlyDenied);
    }

    final result = await Geolocator.getCurrentPosition();

    _currentGeo.value = LatLng(result.latitude, result.longitude);

    _position.value = result;

    final places = await placemarkFromCoordinates(
      result.latitude,
      result.longitude,
    );
    _placemark.value = places[0];

    _currentAddress.value = places[0].street;

    notifyListeners();
  }

  Future<Placemark> getLocationDetails(LatLng geoPoint) async {
    final placemarks = await placemarkFromCoordinates(
      geoPoint.latitude,
      geoPoint.longitude,
    );
    return placemarks[0];
  }

  void updatePlace(Place place) {
    _place.value = place;
  }

  Future<void> getPlace(String placeId) async {
    final request = "/place/details/json?place_id=$placeId";
    try {
      final response = await googleMapDioClient().get(request);
      final result = response.data['result'];

      _place.value = Place(
        placeId: result['place_id'],
        name: result['formatted_address'],
        lat: result['geometry']['location']['lat'],
        lon: result['geometry']['location']['lng'],
        types: (result['types'] as List<dynamic>).map((e) => '$e').toList(),
      );

      notifyListeners();
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
