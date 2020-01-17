import 'package:flutter/foundation.dart';

class PlaceLocation {
  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}
