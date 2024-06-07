import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';

class BuildScheduleItems extends StatelessWidget {
  const BuildScheduleItems({
    super.key,
    required this.h,
    required this.w,
    required this.time,
    required this.isSelected,
    this.onTap,
  });

  final double h;
  final double w;
  final String time;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorManager.transparent,
      highlightColor: ColorManager.transparent,
      onTap: onTap,
      child: Card(
        elevation: isSelected ?5:3,
        color: isSelected ? ColorManager.white : ColorManager.primary,
        child: Container(
          alignment: Alignment.center,
          height: AppSize.s30.h,
          width: AppSize.s100.w,
          decoration: BoxDecoration(
              color: isSelected ? ColorManager.primary : ColorManager.white,
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            time,
            style: getSemiBoldStyle(
                color: isSelected ? ColorManager.white : ColorManager.primary,
                fontSize: FontSize.s16.sp),
          ),
        ),
      ),
    );
  }
}
