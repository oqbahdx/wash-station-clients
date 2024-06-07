import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

import '../resources/color_manager.dart';
import '../resources/value_manager.dart';

class SelectPaymentCard extends StatelessWidget {
  const SelectPaymentCard({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: AppSize.s125.h,
          width: AppSize.s300.w,
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            text,
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s22.sp),
          ),
        ),
      ),
    );
  }
}
