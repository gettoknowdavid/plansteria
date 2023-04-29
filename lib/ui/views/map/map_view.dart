import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: viewModel.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: viewModel.center,
                zoom: 11.0,
              ),
              // initialCameraPosition: CameraPosition(
              //   target: widget.initCoordinates,
              //   zoom: widget.initZoom,
              // ),
              onCameraMove: (CameraPosition newPosition) {
                // print(newPosition.target.toJson());
                viewModel.center = newPosition.target;
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
            Positioned(
              bottom: 1.sh / 2,
              right: (1.sw - 30) / 2,
              child: const Icon(
                Icons.pin,
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
                  onPressed: () {},
                  icon: const Icon(Icons.my_location),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  MapViewModel viewModelBuilder(BuildContext context) => MapViewModel();
}
