import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:washing_track/presentation/bloc/get_location/get_location_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../resources/routes_manager.dart';

class GetLocationView extends StatefulWidget {
  const GetLocationView({super.key});

  @override
  State<GetLocationView> createState() => _GetLocationViewState();
}

class _GetLocationViewState extends State<GetLocationView> {

  Future<void>checkLocationPermission()async{
    var status = await Permission.location.status;
    if(status == PermissionStatus.granted){
      navigateToChooseLocationView();
    }else{
      await Permission.location.request();
    }
  }
  void navigateToChooseLocationView(){
    Navigator.pushNamedAndRemoveUntil(context, Routes.chooseLocationRoute, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: BlocBuilder<GetLocationCubit, GetLocationState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          IconsAssets.markerIc,
                          color: ColorManager.primary,
                          height: AppSize.s50.h,
                          width: AppSize.s50.h,
                        )),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Center(
                    child: Text(
                      AppStrings.hello.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s26.sp),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Text(
                    AppStrings.getLocationMessage.tr(),
                    style: getSemiBoldStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.s18.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: h * 0.3,
                  ),
                  BuildButton(
                    text: AppStrings.useCurrentLocation.tr(),
                    onPressed: () {
                      checkLocationPermission();
                    },
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Text(
                    AppStrings.locationNote.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.grey, fontSize: FontSize.s12.sp),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
