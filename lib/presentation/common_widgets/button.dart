import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/services_history/view/services_history.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildButton extends StatelessWidget {
  const BuildButton(
      {super.key, required this.text, this.onPressed, this.color});

  final String text;
  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s50.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child: InkWell(
            onTap: onPressed,
            child: Card(
              color: ColorManager.primary,
              elevation: 5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  text,
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s24.sp),
                ),
              ),
            ),
          )),
    );
  }
}

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSize.s50.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child: Card(
            color: ColorManager.primary,
            elevation: 5,
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(25)),
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(ColorManager.primary),
                )),
          ),
        ));
  }
}

class LoadingProfileButton extends StatelessWidget {
  const LoadingProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSize.s50.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
          child: Card(
            color: ColorManager.primary,
            elevation: 5,
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Shimmer.fromColors(
                  baseColor: ColorManager.primary,
                  highlightColor: ColorManager.white,
                  child: Text(
                    AppStrings.update.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s24.sp),
                  ),
                ),),
          ),
        ));
  }
}
