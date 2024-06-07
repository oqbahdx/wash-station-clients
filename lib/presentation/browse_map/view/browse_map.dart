import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';


class BrowseWashCarMapView extends StatefulWidget {
  const BrowseWashCarMapView({super.key});

  @override
  State<BrowseWashCarMapView> createState() => BrowseWashCarMapViewState();
}

class BrowseWashCarMapViewState extends State<BrowseWashCarMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final String cameraPositionKey = 'lastCameraPosition';
  late CameraPosition _initialCameraPosition;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  bool screenOpen = true;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<BitmapDescriptor> _getBiggerMarkerIcon(String path, {double width = 64, double height = 64}) async {
    final byteData = await rootBundle.load(path);
    final bytes = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes, size:Size(width, height));
  }

  Future<void> loadMarkerIcons() async {
    final icon = await _getBiggerMarkerIcon('assets/icons/marker.png', width: 128, height: 128);
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId("1"),
        onTap: (){
          Navigator.of(context).pushNamed(Routes.carWashDetailsRoute);
        },
        icon: icon,
        position: const LatLng(37.42796133580664, -122.085749655962),
      ));
      // Add other markers with the same icon.
    });
  }
  // void _saveCameraPosition() async {
  //   if (_mapController != null) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String cameraPositionJson = json.encode(_mapController!.cameraPosition.toMap());
  //     prefs.setString(cameraPositionKey, cameraPositionJson);
  //   }
  // }
  Future<void> takeMeToMyLocation() async {
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition();
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            tilt: 59.440717697143555,
            zoom: 12.151926040649414,
            target: LatLng(position.latitude, position.longitude)),
      ));
    } else {
      await Permission.location.request();
    }
  }
  void _loadCameraPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cameraPositionJson = prefs.getString(cameraPositionKey);
    if (cameraPositionJson != null) {
      CameraPosition? cameraPosition = CameraPosition.fromMap(
        Map<String, dynamic>.from(json.decode(cameraPositionJson)),
      );
      setState(() {
        _initialCameraPosition = cameraPosition!;
      });
    }
  }
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
  @override
  void initState() {
    loadMarkerIcons();
    _loadCameraPosition();
    takeMeToMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          setState(() {
            screenOpen = false;
          });
          Navigator.of(context).pop();
          return true;
        },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     AppStrings.browse.tr(),
        //     style: getSemiBoldStyle(
        //         color: ColorManager.black, fontSize: FontSize.s30),
        //   ),
        //   backgroundColor: ColorManager.textFormLightGrey,
        //   elevation: 0.0,
        // ),
        body: SafeArea(
          child: Stack(
            children: [
              Visibility(
                visible: screenOpen,
                child: GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _kGooglePlex,
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Positioned(
                top: 0,

                child: PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: SizedBox(
                    height: h *.1,
                    width: w * .99,
                    child: AppBar(elevation: 0,
                      backgroundColor: ColorManager.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: h * .5,
                  left: w * .4,
                  child: SvgPicture.asset(IconsAssets.pinIc)),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
