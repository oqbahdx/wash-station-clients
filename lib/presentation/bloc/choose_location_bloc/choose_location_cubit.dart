import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:washing_track/app/app_prefs.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/app/di.dart';
part 'choose_location_state.dart';

class ChooseLocationCubit extends Cubit<ChooseLocationState> {
  ChooseLocationCubit() : super(ChooseLocationInitial());
 AppPreferences appPreferences = instance<AppPreferences>();
  bool isGetLocation = false;
  String? streetName = "";
  LatLng? currentLatLng;
  LatLng? markerLatLng;
  final Completer<GoogleMapController> googleMapController =
  Completer<GoogleMapController>();
  getCurrentPosition() {
    Geolocator.getCurrentPosition().then((currLocation) {
      currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      if (kDebugMode) {
        print("lat : ${currLocation.latitude}");
        print("long : ${currLocation.longitude}");
      }

      // getPlaceName(lat: currLocation.latitude, lon: currLocation.longitude);
      // emit(RemoteGetCurrentPositionState());
    });
    emit(GetCurrentPositionState());
  }

  Future<void> getAddressFromCoordinates(
      double latitude, double longitude) async {
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placeMarks[0];
    streetName = place.street;
    appPreferences.setStreetName(key: 'streetName', value: streetName!);
    appPreferences.getStreetName(key: 'streetName').then((value){
      Constants.streetName = value ?? "";
    });
    debugPrint('Street Name: $streetName');
    emit(GetAddressFromCoordinatesState());
  }

  Future<void> takeMeToMyLocation() async {
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition();
      final GoogleMapController controller = await googleMapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            tilt: 59.440717697143555,
            zoom: 19.151926040649414,
            target: LatLng(position.latitude, position.longitude)),
      ));
    } else {
      await Permission.location.request();
    }
    emit(TakeMeToMyLocationState());
  }
  onTap(){
    markerLatLng = null;
    isGetLocation = false;
    streetName = "";
    emit(OnTapState());
  }
  onLongPress(LatLng latLng){
      markerLatLng = latLng;
      isGetLocation = true;
      getAddressFromCoordinates(
          markerLatLng!.latitude, markerLatLng!.longitude);
    emit(OnLongPressState());
  }
}
