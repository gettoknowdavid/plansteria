import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plansteria/app/app.bottomsheets.dart';
import 'package:plansteria/app/app.locator.dart';
import 'package:plansteria/models/place.dart';
import 'package:plansteria/services/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MapViewModel extends ReactiveViewModel
    with Initialisable, ListenableServiceMixin {
  final _bottomSheetService = locator<BottomSheetService>();
  final _locationService = locator<LocationService>();
  final _navigationService = locator<NavigationService>();

  final _completer = Completer();
  final _geo = ReactiveValue<LatLng>(const LatLng(0.0, 0.0));

  final _address = ReactiveValue<String?>(null);

  final _isSearchBarVisible = ReactiveValue<bool>(false);
  final _bottomSheetHeight = ReactiveValue<double>(0.25.sh);

  MapViewModel() {
    listenToReactiveValues([
      _address,
      _geo,
      _isSearchBarVisible,
      _bottomSheetHeight,
    ]);
  }

  String? get address => _address.value;

  bool get isSearchBarVisible => _isSearchBarVisible.value;
  double get bottomSheetHeight => _bottomSheetHeight.value;

  String? get currentAddress => _locationService.currentAddress;
  LatLng get currentGeo => _locationService.currentGeo;

  Place? get place => _locationService.place;

  CameraPosition get initialPosition => CameraPosition(target: currentGeo);

  @override
  List<ListenableServiceMixin> get listenableServices => [_locationService];

  LatLng get geo => _geo.value;

  Placemark? get placemark => _locationService.placemark;

  Position? get position => _locationService.position;

  bool get detailsLoading => busy(_geo.value);

  Future<void> goToMyLocation() async {
    _address.value = address;

    final _mapController = await _completer.future;

    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentGeo, zoom: 20),
      ),
    );

    notifyListeners();
  }

  @override
  void initialise() async {
    await goToMyLocation();
    _isSearchBarVisible.value = false;
    notifyListeners();
  }

  Future<void> onCameraMove(CameraPosition newPosition) async {
    if (!_isSearchBarVisible.value) {
      final target = newPosition.target;
      final placemark = await _locationService.getLocationDetails(target);
      _address.value = placemark.street;
      final _place = Place(
        placeId: '',
        name: placemark.street!,
        lat: target.latitude,
        lon: target.longitude,
        types: [],
      );
      _locationService.updatePlace(_place);

      notifyListeners();
    }
  }

  void showSearchBar() async {
    setBusy(true);
    _isSearchBarVisible.value = true;

    GoogleMapController _mapController = await _completer.future;

    SheetResponse? result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.mapAddress,
      isScrollControlled: true,
    );

    if (result?.confirmed == true) {
      final newPlace = result?.data as Place?;
      final target = LatLng(newPlace!.lat, newPlace.lon);

      _address.value = newPlace.name;

      _locationService.updatePlace(newPlace);

      _mapController.moveCamera(CameraUpdate.newLatLng(target)).then((value) {
        _isSearchBarVisible.value = false;
        setBusy(false);
      });

      notifyListeners();
    }
  }

  bool confirm() {
    return _navigationService.back(result: place);
  }

  void onMapCreated(GoogleMapController c) => _completer.complete(c);
}
