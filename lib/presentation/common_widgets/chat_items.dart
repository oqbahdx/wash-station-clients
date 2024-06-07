import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';

import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';

class BuildChatList extends StatelessWidget {
  const BuildChatList({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12.w, vertical: AppPadding.p4.h),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 5,
          color: ColorManager.primary,
          child: Container(
            alignment: Alignment.center,
            height: AppSize.s70.h,
            decoration: BoxDecoration(
                color: ColorManager.white,
                border: Border.all(color: ColorManager.primary),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.workerName.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s14.sp),
                  ),
                  Card(
                    elevation: 2,
                    color: ColorManager.primary,
                    child: Container(
                      alignment: Alignment.center,
                      height: AppSize.s45.h,
                      width: AppSize.s45.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorManager.white),
                      child: Icon(
                        Icons.person,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
