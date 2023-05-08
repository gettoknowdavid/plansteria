import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'map_sheet_model.dart';

class MapSheet extends StackedView<MapSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const MapSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    Completer<GoogleMapController> _controller = Completer();

    // const CameraPosition _kLake = CameraPosition(
    //   target: LatLng(45.521563, -122.677433),
    //   zoom: 14.4746,
    // );

    // late GoogleMapController mapController;

    final theme = Theme.of(context);

    LatLng _center = const LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
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

    // const CameraPosition _kPH = CameraPosition(
    //   target: LatLng(4.8472, 6.9746),
    //   zoom: 14.4746,
    // );

    Future<void> _goToPH() async {
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

    return Container(
      // height: 1.sh,
      color: theme.colorScheme.primary,
      child: Column(
        children: [
          20.verticalSpace,
          Container(
            // height: 80.r,
            width: 1.sw,
            color: theme.colorScheme.primary,
            padding: const EdgeInsets.fromLTRB(0, 8, 18, 8).r,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BackButton(),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  // initialCameraPosition: CameraPosition(
                  //   target: widget.initCoordinates,
                  //   zoom: widget.initZoom,
                  // ),
                  onCameraMove: (CameraPosition newPosition) {
                    // print(newPosition.target.toJson());
                    _center = newPosition.target;
                  },
                  // markers: {_marker},
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: false,
                  zoomGesturesEnabled: true,
                  padding: const EdgeInsets.all(0),
                  buildingsEnabled: true,
                  cameraTargetBounds: CameraTargetBounds.unbounded,
                  compassEnabled: true,
                  indoorViewEnabled: false,
                  mapToolbarEnabled: true,
                  minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  trafficEnabled: false,
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(14, 30, 14, 14).r,
                //   child: const AppBackButton(addColor: true),
                // ),
                Positioned(
                  bottom: 1.sh / 2,
                  right: (1.sw - 30) / 2,
                  child: const Icon(
                    Icons.person_pin_circle,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Container(
                    color: Colors.white,
                    child: IconButton(
                      onPressed: _goToPH,
                      icon: const Icon(Icons.my_location),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  MapSheetModel viewModelBuilder(BuildContext context) => MapSheetModel();
}
