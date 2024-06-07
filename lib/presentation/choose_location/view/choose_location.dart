import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washing_track/presentation/bloc/choose_location_bloc/choose_location_cubit.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';
import 'package:custom_info_window/custom_info_window.dart';

class ChooseLocationView extends StatefulWidget {
  const ChooseLocationView({super.key});

  @override
  State<ChooseLocationView> createState() => _ChooseLocationViewState();
}

class _ChooseLocationViewState extends State<ChooseLocationView> {
  GoogleMapController? _mapController;

  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void initState() {
    context.read<ChooseLocationCubit>().getCurrentPosition();
    context.read<ChooseLocationCubit>().takeMeToMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChooseLocationCubit>();
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: BlocBuilder<ChooseLocationCubit, ChooseLocationState>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(cubit.currentLatLng?.latitude ?? 0.0,
                          cubit.currentLatLng?.latitude ?? 0.0)),
                  onMapCreated: (GoogleMapController controller) {
                    cubit.googleMapController.complete(controller);
                    _mapController = controller;
                    _customInfoWindowController.googleMapController =
                        controller;
                  },
                  onTap: (LatLng latLng) {
                    cubit.onTap();
                    (position) {
                      _customInfoWindowController.hideInfoWindow!();
                    };
                  },
                  onCameraMove: (position) {
                    // _customInfoWindowController.onCameraMove();
                  },
                  onLongPress: (LatLng latLng) {
                    cubit.onLongPress(latLng);
                  },
                  markers: cubit.markerLatLng == null
                      ? {}
                      : {
                          Marker(
                              markerId: const MarkerId("marker_id"),
                              position: cubit.markerLatLng!,
                              anchor: const Offset(0.5, 0.5),
                              onTap: () {},
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueRed))
                        },
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                      height: h * .1,
                      width: w * .9,
                      child: AppBar(
                        backgroundColor: ColorManager.transparent,
                        elevation: 0,
                      )),
                ),
                Positioned(
                  top: h * .05,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
                    child: SizedBox(
                      height: h * 0.1,
                      width: w * .9,
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          alignment: Alignment.center,
                          height: AppSize.s50.h,
                          width: w,
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              cubit.streetName == ""
                                  ? AppStrings.selectLocationTip.tr()
                                  : cubit.streetName!,
                              style: getSemiBoldStyle(
                                  color: ColorManager.white,
                                  fontSize: cubit.streetName == ""
                                      ? FontSize.s14.sp
                                      : FontSize.s18.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: h * .79,
                  right: w * .07,
                  child: InkWell(
                    onTap: cubit.takeMeToMyLocation,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: w * .15,
                        width: w * .15,
                        decoration: BoxDecoration(
                            color: ColorManager.primary,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.location_history,
                          color: ColorManager.white,
                          size: AppSize.s40,
                        ),
                      ),
                    ),
                  ),
                ),
                cubit.isGetLocation == true
                    ? Positioned(
                        top: h * .8,
                        left: w * .15,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.homeRoute);
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                              alignment: Alignment.center,
                              height: h * .06,
                              width: w * .5,
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                AppStrings.next.tr(),
                                style: getSemiBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s20.sp),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }
}
