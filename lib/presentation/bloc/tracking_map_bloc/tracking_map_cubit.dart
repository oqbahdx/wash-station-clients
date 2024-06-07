import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'dart:math' as math;
part 'tracking_map_state.dart';

class TrackingMapCubit extends Cubit<TrackingMapState> {
  TrackingMapCubit() : super(TrackingMapInitial());
  final List<Marker> markers =   [
  const Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(21.450123, 39.2111492),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: const MarkerId('marker2'),
      position: const LatLng(21.550123, 39.3111492),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ),
  ];
  double haversine(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // Earth radius in km

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return R * c;
  }

  double _toRadians(double degrees) {
    return degrees * math.pi / 180;
  }
  late double distance;
  late Duration expectedTravelTime;
  GoogleMapController? googleMapController;
  void moveCameraBetweenLocations() {
    // First location
    LatLng location1 = const LatLng(21.450123, 39.2111492);

    // Second location
    LatLng location2 = const LatLng(21.550123, 39.3111492);

    // Calculate the bounds that include both locations
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        location1.latitude < location2.latitude
            ? location1.latitude
            : location2.latitude,
        location1.longitude < location2.longitude
            ? location1.longitude
            : location2.longitude,
      ),
      northeast: LatLng(
        location1.latitude > location2.latitude
            ? location1.latitude
            : location2.latitude,
        location1.longitude > location2.longitude
            ? location1.longitude
            : location2.longitude,
      ),
    );

    // Move the camera to the calculated bounds
    googleMapController!.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 50.0), // 50.0 padding
    );
  }
}
