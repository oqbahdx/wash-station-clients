import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washing_track/presentation/bloc/find_car_wash_bloc/find_car_wash_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class FindCarWashView extends StatefulWidget {
  const FindCarWashView({super.key});

  @override
  State<FindCarWashView> createState() => FindCarWashViewState();
}

class FindCarWashViewState extends State<FindCarWashView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _jeddahMap = CameraPosition(
    target: LatLng(21.450123, 39.2111492),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    context.read<FindCarWashCubit>().loadMarkerIcons(context);
    context.read<FindCarWashCubit>().takeMeToMyLocation(_controller);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return WillPopScope(
      onWillPop: () async {
        context.read<FindCarWashCubit>().openScreen();
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Visibility(
                visible: context.read<FindCarWashCubit>().screenOpen,
                child: GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _jeddahMap,
                  markers: context.read<FindCarWashCubit>().markers,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                child: BuildButton(
                  text: AppStrings.requestWash.tr(),
                  color: ColorManager.primary,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.choosePackagesAndServicesRoute);
                  },
                ),
              ),
              Positioned(
                  top: h * 0.5,
                  left: w * 0.35,
                  child: SvgPicture.asset(IconsAssets.pinIc)),
            ],
          ),
        ),
      ),
    );
  }
}
