import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../common_widgets/book_details_items.dart';

class BookingDetailsView extends StatelessWidget {
  const BookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * .15),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.primary,
              statusBarIconBrightness: Brightness.light),
          elevation: 0.0,
          backgroundColor: ColorManager.primary,
          iconTheme: IconThemeData(color: ColorManager.white),
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: AppSize.s80.h, left: 8, right: 8),
            child: SizedBox(
              height: h * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: w * .2,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/images/splash.jpg'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                        color: ColorManager.textFormDarkGrey),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.carWashing.tr(),
                        style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s18.sp),
                      ),
                      Container(
                          height: h * 0.04,
                          width: w * .15,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorManager.teal,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            AppStrings.waiting.tr(),
                            style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s12.sp),
                          ))
                    ],
                  ),
                  Card(
                    elevation: 5,
                    color: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorManager.white,
                          ),
                          shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                            color: ColorManager.white,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Divider(),
              BuildBookDetailsItems(
                h: h * .11,
                text1: AppStrings.dateAndTime.tr(),
                text2: 'Monday, October 24',
                text3: '10:00 ${AppStrings.am.tr()}',
                widget: const SizedBox()
              ),
              SizedBox(
                height: h * .025,
              ),
              BuildBookDetailsItems(
                  h: h * .11,
                  text1: AppStrings.addAddress.tr(),
                  text2: 'San Francisco, California',
                  text3: '0.31 mi away',
                  widget: Container(
                    alignment: Alignment.center,
                    height: w * 0.2,
                    width: w * 0.2,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: SvgPicture.asset(IconsAssets.markerIc,
                        color: ColorManager.error,
                        height: w * 0.1,
                        width: w * 0.1),
                  )),
              SizedBox(
                height: h * .025,
              ),
              BuildBookDetailsItems(
                h: h * .11,
                text1: AppStrings.vehicleType.tr(),
                text2: AppStrings.regularCar.tr(),
                text3: 'Sedan, Van, Hatchback',
                widget: const SizedBox()
              ),
              SizedBox(
                height: h * .025,
              ),
              BuildBookDetailsItems(
                  h: h * .11,
                  text1: AppStrings.packages.tr(),
                  text2: AppStrings.basicHandWash.tr(),
                  text3: '30 ${AppStrings.min.tr()}',
                  widget: Container()),
              SizedBox(
                height: h * .025,
              ),
              BuildBookDetailsItems(
                  h: h * .11,
                  text1: AppStrings.cost.tr(),
                  text2:
                      '${AppStrings.total.tr()} ${AppStrings.riyal.tr()} 15.75',
                  text3: AppStrings.noTax.tr(),
                  widget: Container()),
              SizedBox(
                height: h * 0.025,
              ),
              BuildButton(
                text: AppStrings.cancel.tr(),
                color: ColorManager.error,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
