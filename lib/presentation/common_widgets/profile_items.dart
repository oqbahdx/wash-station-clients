import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/common_widgets/textField.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

import '../../app/languages_manager.dart';
import '../resources/color_manager.dart';
import '../resources/value_manager.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Card(
          elevation: 5,
          color: ColorManager.primary,
          child: Container(
            alignment: Alignment.center,
            height: AppSize.s125.h,
            width: AppSize.s125.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorManager.white,
            ),
            child: Shimmer.fromColors(
              baseColor: ColorManager.primary,
              highlightColor: ColorManager.white,
              child: Icon(
                Icons.add,
                color: ColorManager.black,
                size: AppSize.s50,
              ),
            ),
          ),
        ),
        SizedBox(
          height: h * .075,
        ),
        BuildTextFormLoading(
          text: AppStrings.firstName.tr(),
        ),
        SizedBox(
          height: h * .05,
        ),
        BuildTextFormLoading(
          text: AppStrings.lastName.tr(),
        ),
        SizedBox(
          height: h * .05,
        ),
        BuildTextFormLoading(
          text: AppStrings.phoneNumber.tr(),
        ),
      ],
    );
  }
}

class BuildTextFormLoading extends StatelessWidget {
  const BuildTextFormLoading({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorManager.primary,
      child: Container(
        alignment: Alignment.centerRight,
        height: AppSize.s50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.white,
        ),
        child: Shimmer.fromColors(
            baseColor: ColorManager.primary,
            highlightColor: ColorManager.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
              child: Text(
                text,
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s17.sp),
              ),
            )),
      ),
    );
  }
}
class BuildDrawer extends StatefulWidget {
  const BuildDrawer({
    super.key,
    required this.h,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final double h;
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
      child: Column(
        children: [
          SizedBox(
            height: widget.h * .05,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Card(
              color: ColorManager.primary,
              elevation: 5,
              child: Container(
                alignment: Alignment.center,
                height: AppSize.s60,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          widget.text,
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize:
                              isRTL() ? FontSize.s16.sp : FontSize.s14.sp),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          widget.icon,
                          color: ColorManager.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}