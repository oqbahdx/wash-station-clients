import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';

class BuildBookingItems extends StatelessWidget {
  const BuildBookingItems({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: ColorManager.white,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(15)
          ),
          
          child: Padding(
            padding: EdgeInsets.only(
                top: AppPadding.p4.h,
                right: AppPadding.p4.w,
                left: AppPadding.p4.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.carWashing.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s16.sp),
                    ),
                    Text(
                      AppStrings.washingServices.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    Text(
                      "9 Feb 2019 - 09:00 PM",
                      style: getSemiBoldStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14.sp),
                    ),
                  ],
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "${AppStrings.riyal.tr()} 15.75",
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s16.sp),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildBookingItemsLoading extends StatelessWidget {
  const BuildBookingItemsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorManager.white,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.only(
              top: AppPadding.p4.h,
              right: AppPadding.p4.w,
              left: AppPadding.p4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: ColorManager.primary,
                    highlightColor: ColorManager.white,
                    child: Text(
                      AppStrings.carWashing.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s16.sp),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: ColorManager.primary,
                    highlightColor: ColorManager.white,
                    child: Text(
                      AppStrings.washingServices.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s14.sp),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: ColorManager.primary,
                    highlightColor: ColorManager.white,
                    child: Text(
                      "9 Feb 2024 - 09:00 PM",
                      style: getSemiBoldStyle(
                          color: ColorManager.textFormLightGrey,
                          fontSize: FontSize.s14.sp),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Shimmer.fromColors(
                baseColor: ColorManager.primary,
                highlightColor: ColorManager.white,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "${AppStrings.riyal.tr()} 15.75",
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: FontSize.s16.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
