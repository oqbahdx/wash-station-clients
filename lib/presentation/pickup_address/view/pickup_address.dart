import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

class PickupAddressView extends StatefulWidget {
  const PickupAddressView({super.key});

  @override
  State<PickupAddressView> createState() => _PickupAddressViewState();
}

class _PickupAddressViewState extends State<PickupAddressView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng? _markerLatLng;
  LatLng? currentLatLng;
  GoogleMapController? _mapController;
  bool isGetLocation = false;
  Future<void> takeMeToMyLocation() async {
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition();
      final GoogleMapController controller = await _controller.future;
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
  }

  @override
  void initState() {
    super.initState();
    takeMeToMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.addAddressRoute);
              },
              icon: Icon(
                Icons.add,
                color: ColorManager.black,
                size: AppSize.s30,
              ))
        ],
        elevation: 0,
        title: Text(
          "Pickup Address",
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s20),
        ),
        backgroundColor: ColorManager.white,
      ),
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
              target: LatLng(currentLatLng?.latitude ?? 0.0,
                  currentLatLng?.latitude ?? 0.0)),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            _mapController = controller;
          },
          onTap: (LatLng latLng) {
            setState(() {
              _markerLatLng = null;
              isGetLocation = false;
            });

            (position) {};
          },
          onCameraMove: (position) {
            // _customInfoWindowController.onCameraMove();
          },
          onLongPress: (LatLng latLng) {
            setState(() {
              _markerLatLng = latLng;
              isGetLocation = true;
            });
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * .02,
                          ),
                          Container(
                            height: h * .01,
                            width: w * .12,
                            decoration: BoxDecoration(
                              color: ColorManager.textFormDarkGrey,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          SizedBox(
                            height: h * .04,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Home",
                                style: getSemiBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s17),
                              )),
                          SizedBox(
                            height: h * .01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: w * .6,
                                child: Text(
                                  "43 Bourke Street, Newbridge NSW 837 Raffles Place, Boat Band M83",
                                  style: getMediumStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s14),
                                ),
                              ),
                              SvgPicture.asset(IconsAssets.checksIc)
                            ],
                          ),
                          const Divider(),
                          SizedBox(
                            height: h * .04,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Office",
                                style: getSemiBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s17),
                              )),
                          SizedBox(
                            height: h * .01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: w * .6,
                                child: Text(
                                  "842 Balona Street, Newbridge NSW 125 Rose Park, Boat Band L27",
                                  style: getMediumStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s14),
                                ),
                              ),
                              Container(
                                height: w * .05,
                                width: w * .05,
                                decoration: BoxDecoration(
                                    color: ColorManager.white,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: ColorManager.black)),
                              ),
                            ],
                          ),
                          const Divider(),
                          SizedBox(
                            height: h * .065,
                          ),
                          SizedBox(
                            height: h * 0.08,
                            width: w * .9,
                            child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushNamed(Routes.deliveryAddressRoute);
                                },
                                child: Text(
                                  "Next",
                                  style: getSemiBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s22),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          markers: _markerLatLng == null
              ? {}
              : {
                  Marker(
                      markerId: const MarkerId("marker_id"),
                      position: _markerLatLng!,
                      anchor: const Offset(0.5, 0.5),
                      onTap: () {},
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed))
                },
        ),
      ),
    );
  }
}
