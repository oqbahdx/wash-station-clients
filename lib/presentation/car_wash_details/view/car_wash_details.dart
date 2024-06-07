import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
class CarWashDetails extends StatelessWidget {
  const CarWashDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(h * 0.26),
              child: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: ColorManager.primary,
                    statusBarIconBrightness: Brightness.light
                ),
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    ColorManager.textFormLightGrey,
                    ColorManager.textFormDarkGrey,
                    ColorManager.grey,
                    ColorManager.black,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h * .05,
                        ),
                        Center(
                          child: Text(
                            "375 x 352",
                            style: getSemiBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s30.sp),
                          ),
                        ),
                        SizedBox(
                          height: h * .03,
                        ),
                        Text(
                          AppStrings.carWashing.tr(),
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s25.sp),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              IconsAssets.starsIc,
                              height: h * .02,
                              width: w * .25,
                            ),
                            SizedBox(
                              width: w * .05,
                            ),
                            Text(
                              "9.4",
                              style: getRegularStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s14.sp),
                            ),
                            SizedBox(
                              width: w * .05,
                            ),
                            Text(
                              "(146 ${AppStrings.ratings.tr()})",
                              style: getRegularStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(height: h*.07,),
                  Text(
                    AppStrings.services.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s18.sp),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          IconsAssets.seatIc,
                          height: AppSize.s20.h,
                          width: AppSize.s20.w,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppStrings.seatCleaning.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: FontSize.s14.sp),
                        ),
                      ),


                      Expanded(
                        child: SvgPicture.asset(
                          IconsAssets.vacuumIc,
                          height: AppSize.s20.h,
                          width: AppSize.s20.w,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          AppStrings.trunkVacuum.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: FontSize.s14.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          IconsAssets.dashboardIc,
                          height: AppSize.s20.h,
                          width: AppSize.s20.w,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppStrings.dashboardClean.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: FontSize.s14.sp),
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          IconsAssets.sunIc,
                          height: AppSize.s20.h,
                          width: AppSize.s20.w,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          AppStrings.paintProtection.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: FontSize.s14.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          IconsAssets.engineIc,
                          height: AppSize.s20.h,
                          width: AppSize.s20.w,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          AppStrings.engineSteam.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: FontSize.s14.sp),
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          IconsAssets.tyreIc,
                          height: AppSize.s20.h,
                          width: AppSize.s20.w,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          AppStrings.tireDressing.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: FontSize.s14.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * .025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsAssets.dashboardIc,
                        height: AppSize.s20.h,
                        width: AppSize.s20.w,
                      ),
                      SizedBox(
                        width: w * .1,
                      ),
                      Text(
                        AppStrings.reviews.tr(),
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s14.sp
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    AppStrings.description.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s18.sp),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    AppStrings.carWashDescription.tr(),
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s16.sp),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    AppStrings.location.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s18.sp),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    "43 Bourke Street, Newbridge NSW 837 Raffles Place, Boat Band M83",
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s14.sp),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: h * .3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                              colors: [
                                ColorManager.textFormLightGrey,
                                ColorManager.textFormDarkGrey,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.distance.tr(),
                                      style: getRegularStyle(
                                          color: ColorManager.grey,
                                          fontSize: FontSize.s14.sp),
                                    ),
                                    Text(
                                      "10.23 ${AppStrings.km.tr()}",
                                      style: getRegularStyle(
                                          color: ColorManager.grey,
                                          fontSize: FontSize.s14.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: w * .1,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      AppStrings.time.tr(),
                                      style: getRegularStyle(
                                          color: ColorManager.grey,
                                          fontSize: FontSize.s14.sp),
                                    ),
                                    Text(
                                      "12.30 ${AppStrings.am.tr()}",
                                      style: getRegularStyle(
                                          color: ColorManager.grey,
                                          fontSize: FontSize.s14.sp),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                SvgPicture.asset(IconsAssets.buttonDirectionIc)
                              ],
                            ),
                            SizedBox(
                              height: h * .05,
                            ),
                            SvgPicture.asset(IconsAssets.routeIc)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    AppStrings.reviews.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s18.sp),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  ListTile(
                    leading: Container(
                      alignment: Alignment.center,
                      height: w * .15,
                      width: w * .15,
                      decoration: BoxDecoration(
                          color: ColorManager.grey, shape: BoxShape.circle),
                      child: Text(
                        "40 x 40",
                        style: getRegularStyle(
                          color: ColorManager.textFormLightGrey,
                        ),
                      ),
                    ),
                    title: Text(
                      "Sri Wedari Soekarno",
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(IconsAssets.starsIc),
                        SizedBox(width: w *.05,),
                        Text(
                          "15 ${AppStrings.minutesAgo.tr()}",
                          style: getRegularStyle(
                              color: ColorManager.grey, fontSize: FontSize.s14.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Text(
                    "I'm definitely not one to sweat the small stuff anymore. I can't describe how great it is to be able to go home to your wife, kids and family and get back to normal life.",
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s14.sp),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconsAssets.dashboardIc,
                        height: w * 0.05,
                        width: w * 0.05,
                      ),
                      SizedBox(
                        width: h * .1,
                      ),
                      Text(
                        AppStrings.reviews.tr(),
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s14.sp),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: h * .085,
                  ),
                  SizedBox(
                    height: AppSize.s60.h,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.choosePackagesAndServicesRoute);
                        },
                        child: Text(
                          AppStrings.bookNow.tr(),
                          style: getSemiBoldStyle(
                              color: ColorManager.white, fontSize: FontSize.s25.sp),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 5,
            top: h * 0.25,
            child: Container(
                decoration: BoxDecoration(
                    color: ColorManager.white, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: ColorManager.error,
                      size: AppSize.s30,
                    ))))
      ],
    );
  }
}
