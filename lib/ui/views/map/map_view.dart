import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:plansteria/ui/widgets/app_back_button.dart';
import 'package:plansteria/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';

import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: viewModel.onMapCreated,
            initialCameraPosition: viewModel.initialPosition,
            onCameraMove: viewModel.onCameraMove,
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
            top: 1.sh / 2,
            right: (1.sw - 30) / 2,
            child: const Icon(
              PhosphorIcons.mapPinFill,
              size: 40,
              color: Colors.black,
            ),
          ),
          Positioned(
            bottom: 0.27.sh,
            right: 14,
            child: Container(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: viewModel.goToMyLocation,
                icon: const Icon(Icons.my_location),
              ),
            ),
          ),
          const Positioned(
            left: 8,
            top: 36,
            child: AppBackButton(addColor: true),
          ),
        ],
      ),
      bottomSheet: const LocationBottomSheet(),
    );
  }

  @override
  MapViewModel viewModelBuilder(BuildContext context) => MapViewModel();
}

class LocationBottomSheet extends ViewModelWidget<MapViewModel> {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context, MapViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isLight = theme.brightness == Brightness.light;

    return BottomSheet(
      onClosing: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14).r,
      ),
      elevation: 0,
      backgroundColor: isLight ? Colors.white : null,
      constraints: BoxConstraints(maxHeight: 0.25.sh, minHeight: 0.2.sh),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(14, 20, 14, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SkeletonLoader(
                      loading: viewModel.detailsLoading,
                      child: Text(
                        viewModel.address ?? 'Unknown',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: viewModel.showSearchBar,
                    icon: const Icon(PhosphorIcons.magnifyingGlass),
                  )
                ],
              ),
              26.verticalSpace,
              AppButton(
                onPressed: viewModel.confirm,
                title: 'Confirm location',
              ),
            ],
          ),
        );
      },
    );
  }
}
