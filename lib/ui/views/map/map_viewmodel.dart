import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends BaseViewModel {
  final Completer<GoogleMapController> _controller = Completer();

  // static const CameraPosition _kLake = CameraPosition(
  //   target: LatLng(45.521563, -122.677433),
  //   zoom: 14.4746,
  // );

  late GoogleMapController mapController;

  LatLng center = const LatLng(45.521563, -122.677433);

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  // static const CameraPosition _kPH = CameraPosition(
  //   target: LatLng(4.8472, 6.9746),
  //   zoom: 14.4746,
  // );

  Future<void> goToPH() async {
    final GoogleMapController controller = await _controller.future;

    final loc = await _determinePosition();
    final lat = loc.latitude;
    final lon = loc.longitude;

    final _curLoc = CameraPosition(target: LatLng(lat, lon), zoom: 16);

    // final placemarks = await placemarkFromCoordinates(lat, lon);
    // final place = placemarks[0];

    // print("===============================================================");
    // print("${place.country} ${place.country} ${place.country}");
    // print("===============================================================");

    controller.animateCamera(CameraUpdate.newCameraPosition(_curLoc));
  }

  // Marker _marker = Marker(
  //   markerId: const MarkerId('kCurrentLocation'),
  //   infoWindow: const InfoWindow(title: "Your Current Location"),
  //   icon: BitmapDescriptor.defaultMarker,
  //   position: _kPH.target,
  // );
}
