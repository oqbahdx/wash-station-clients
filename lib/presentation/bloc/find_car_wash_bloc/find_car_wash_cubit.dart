import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';

part 'find_car_wash_state.dart';

class FindCarWashCubit extends Cubit<FindCarWashState> {
  FindCarWashCubit() : super(FindCarWashInitial());

  Future<void> takeMeToMyLocation(Completer<GoogleMapController> newController) async {
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition();
      final GoogleMapController controller = await newController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            tilt: 59.440717697143555,
            zoom: 19.151926040649414,
            target: LatLng(position.latitude, position.longitude)),
      ));
    } else {
      await Permission.location.request();
    }
  }
  final Set<Marker> markers = {};
  Future<void> loadMarkerIcons(BuildContext ctx) async {
    final icon = await _getBiggerMarkerIcon('assets/icons/marker.png',
        width: 128, height: 128);

      markers.add(Marker(
        markerId: const MarkerId("1"),
        onTap: () {
          Navigator.of(ctx).pushNamed(Routes.carWashDetailsRoute);
        },
        icon: icon,
        position: const LatLng(37.42796133580664, -122.085749655962),
      ));
      // Add other markers with the same icon.
       emit(GetMarkersSuccessState());
  }

  Future<BitmapDescriptor> _getBiggerMarkerIcon(String path,
      {double width = 64, double height = 64}) async {
    final byteData = await rootBundle.load(path);
    final bytes = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes, size: Size(width, height));
  }
  bool screenOpen = true;
  void openScreen(){
    screenOpen = true;
    emit(OpenScreenState());
  }
  void closeScreen(){
    screenOpen = true;
    emit(CloseScreenState());
  }
}
