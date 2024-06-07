import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../resources/fonts_manager.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(),
          child: Column(
            children: [
              SizedBox(
                height: h * .1,
              ),
              Card(
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  height: AppSize.s80.h,
                  width: AppSize.s80.h,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.done,
                    size: AppSize.s40,
                  ),
                ),
              ),
              SizedBox(
                height: h * .1,
              ),
              Text(
                AppStrings.booking.tr(),
                style: getBoldStyle(
                    color: ColorManager.white, fontSize: FontSize.s25.sp),
              ),
              SizedBox(
                height: h * .07,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.bookingSuccessMessage.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s20.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: h * .2,
              ),
              SizedBox(
                height: AppSize.s60.h,
                child: BuildButton(
                  text: AppStrings.done.tr(),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.homeRoute, (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
