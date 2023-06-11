import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapSheetModel extends ReactiveViewModel {
  final _completer = Completer();

  void onMapCreated(GoogleMapController c) => _completer.complete(c);
}
