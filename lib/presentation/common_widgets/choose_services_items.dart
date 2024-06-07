import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';

class BuildChooseServicesItems extends StatefulWidget {
  const BuildChooseServicesItems({
    super.key,
    required this.h,
    required this.w,
    required this.feature,
    required this.price,
    this.onTap,
    required this.isSelected,
  });

  final double h;
  final double w;
  final String feature;
  final String price;
  final void Function()? onTap;
  final bool isSelected;

  @override
  State<BuildChooseServicesItems> createState() => _BuildChooseServicesItemsState();
}

class _BuildChooseServicesItemsState extends State<BuildChooseServicesItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      splashColor: ColorManager.transparent,
      highlightColor: ColorManager.transparent,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: AppPadding.p4.h),
        child: Card(
          elevation: 5,
          color: ColorManager.primary,
          child: Container(
            height: AppSize.s50.h,
            width: widget.w * .9,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.feature,
                      style: getSemiBoldStyle(
                          color: Colors.black, fontSize: isRTL()?FontSize.s18.sp:FontSize.s16.sp),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      widget.price,
                      style: getSemiBoldStyle(
                          color: Colors.black, fontSize: isRTL()?FontSize.s12.sp:FontSize.s12.sp),
                    ),
                  ),
                 Expanded(
                   flex: 1,
                   child: widget.isSelected? SvgPicture.asset(IconsAssets.checksIc):Container(
                     height: widget.w * .05,
                     width: widget.w * .05,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         border: Border.all(
                             color: ColorManager.black
                         )
                     ),
                   ),
                 )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  isRTL(){
    return context.locale == ARABIC_LOCALE;
  }
}
