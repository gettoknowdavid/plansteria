import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plansteria/ui/bottom_sheets/app_bottom_sheet_wrapper.dart';
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
    final address = request.data.address;
    GeoPoint geo = request.data.geo;
    final target = LatLng(geo.latitude, geo.longitude);

    return AppBottomSheetWrapper(
      padding: EdgeInsets.zero,
      child: Container(
        height: 0.8.sh,
        decoration: const BoxDecoration(),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)).r,
          child: GoogleMap(
            onMapCreated: viewModel.onMapCreated,
            initialCameraPosition: CameraPosition(target: target, zoom: 16),
            markers: {
              Marker(
                markerId: MarkerId('$address'),
                infoWindow: InfoWindow(title: '$address'),
                icon: BitmapDescriptor.defaultMarker,
                position: target,
              ),
            },
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: false,
            zoomGesturesEnabled: true,
            buildingsEnabled: true,
            cameraTargetBounds: CameraTargetBounds.unbounded,
            minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            trafficEnabled: false,
          ),
        ),
      ),
    );
  }

  @override
  MapSheetModel viewModelBuilder(BuildContext context) => MapSheetModel();
}
