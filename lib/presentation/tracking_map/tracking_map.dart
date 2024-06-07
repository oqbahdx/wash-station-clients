import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washing_track/presentation/bloc/tracking_map_bloc/tracking_map_cubit.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

class TrackingMapView extends StatefulWidget {
  const TrackingMapView({super.key});

  @override
  State<TrackingMapView> createState() => _TrackingMapViewState();
}

class _TrackingMapViewState extends State<TrackingMapView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _jeddahMap = CameraPosition(
    target: LatLng(21.450123, 39.2111492),
    zoom: 10.4746,
  );

  @override
  void initState() {
    super.initState();
    context.read<TrackingMapCubit>().distance = context
        .read<TrackingMapCubit>()
        .haversine(21.450123, 39.2111492, 21.550123, 39.2111492);
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TrackingMapCubit>();
    return Scaffold(
      body: BlocConsumer<TrackingMapCubit, TrackingMapState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: _jeddahMap,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    setState(() {
                      cubit.googleMapController = controller;
                    });
                  },
                  markers: Set<Marker>.of(cubit.markers),
                  zoomControlsEnabled: false,
                ),
                Positioned(
                    bottom: 10,
                    child: Container(
                      alignment: Alignment.center,
                      height: AppSize.s100.h,
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.white60,
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Text(""),
                              Text(""),
                            ],
                          ),
                          Row(
                            children: [
                              Text(""),
                              Text(""),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (kDebugMode) {
            cubit.moveCameraBetweenLocations();
            print("distance : ${cubit.distance.toStringAsFixed(2)} KM");
            double speed = 65;
            double timeInHours = cubit.distance / speed;
            double timeInMinutes = timeInHours * 60;
            print('The time taken is $timeInMinutes minutes.');
          }
        },
      ),
    );
  }
}
// todo  : add expected time and destination in view