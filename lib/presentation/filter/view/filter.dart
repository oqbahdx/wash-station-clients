import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/common_widgets/start_rating.dart';
import 'package:washing_track/presentation/common_widgets/vehicle_type.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;
  bool isActive6 = false;
  bool isRating1 = true;
  bool isRating2 = false;
  bool isRating3 = false;
  bool isRating4 = false;
  bool isRating5 = false;
  bool opt1 = false;
  bool opt2 = false;
  bool opt3 = false;
  bool opt4 = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light
        ),
        elevation: 0.0,
        backgroundColor: ColorManager.white,
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  isActive1 = false;
                  isActive2 = false;
                  isActive3 = false;
                  isActive4 = false;
                  isActive5 = false;
                  isActive6 = false;
                  isRating1 = true;
                  isRating2 = false;
                  isRating3 = false;
                  isRating4 = false;
                  isRating5 = false;
                  opt1 = false;
                  opt2 = false;
                  opt3 = false;
                  opt4 = false;
                });
              },
              child: Text(
                AppStrings.reset.tr(),
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s17),
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.filter.tr(),
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s30),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  AppStrings.sortOption.tr(),
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s22),
                ),
                const Divider(),
                SizedBox(
                  height: h * 0.005,
                ),
                InkWell(
                  splashColor: ColorManager.transparent,
                  onTap: () {
                    setState(() {
                      opt1 = !opt1;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.applyFilters.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s22),
                      ),
                      opt1 ? SvgPicture.asset(IconsAssets.checksIc) : Container()
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: h * 0.005,
                ),
                InkWell(
                  splashColor: ColorManager.transparent,
                  onTap: () {
                    setState(() {
                      opt2 = !opt2;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.startRatingHighest.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s22),
                      ),
                      opt2 ? SvgPicture.asset(IconsAssets.checksIc) : Container()
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: h * 0.005,
                ),
                InkWell(
                  splashColor: ColorManager.transparent,
                  onTap: () {
                    setState(() {
                      opt3 = !opt3;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.bestReviewedFirst.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s22),
                      ),
                      opt3 ? SvgPicture.asset(IconsAssets.checksIc) : Container()
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: h * 0.005,
                ),
                InkWell(
                  splashColor: ColorManager.transparent,
                  onTap: () {
                    setState(() {
                      opt4 = !opt4;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.mostReviewedFirst.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s22),
                      ),
                      opt4 ? SvgPicture.asset(IconsAssets.checksIc) : Container()
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: h * 0.005,
                ),
                Text(
                  AppStrings.vehicleType.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s22),
                ),
                SizedBox(
                  height: h * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildVehicleType(
                      text: AppStrings.regularSizeCar.tr(),
                      isActive: isActive1,
                      onTap: () {
                        setState(() {
                          isActive2 = false;
                          isActive1 = true;
                          isActive3 = false;
                          isActive4 = false;
                          isActive5 = false;
                          isActive6 = false;
                        });
                      },
                    ),
                    BuildVehicleType(
                        text: AppStrings.mediumSizeCar.tr(),
                        isActive: isActive2,
                        onTap: () {
                          setState(() {
                            isActive2 = true;
                            isActive1 = false;
                            isActive3 = false;
                            isActive4 = false;
                            isActive5 = false;
                            isActive6 = false;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: h * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildVehicleType(
                      text: AppStrings.compactSuv.tr(),
                      isActive: isActive3,
                      onTap: () {
                        setState(() {
                          isActive2 = false;
                          isActive1 = false;
                          isActive3 = true;
                          isActive4 = false;
                          isActive5 = false;
                          isActive6 = false;
                        });
                      },
                    ),
                    BuildVehicleType(
                        text: AppStrings.miniVan.tr(),
                        isActive: isActive4,
                        onTap: () {
                          setState(() {
                            isActive2 = false;
                            isActive1 = false;
                            isActive3 = false;
                            isActive4 = true;
                            isActive5 = false;
                            isActive6 = false;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: h * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BuildVehicleType(
                      text: AppStrings.pickupTruck.tr(),
                      isActive: isActive5,
                      onTap: () {
                        setState(() {
                          isActive2 = false;
                          isActive1 = false;
                          isActive3 = false;
                          isActive4 = false;
                          isActive5 = true;
                          isActive6 = false;
                        });
                      },
                    ),
                    BuildVehicleType(
                        text: AppStrings.cargoTruck.tr(),
                        isActive: isActive6,
                        onTap: () {
                          setState(() {
                            isActive2 = false;
                            isActive1 = false;
                            isActive3 = false;
                            isActive4 = false;
                            isActive5 = false;
                            isActive6 = true;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: h * 0.005,
                ),
                Text(
                  AppStrings.startRating.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s22),
                ),
                SizedBox(
                  height: h * 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildStartRatingWidget(
                        text: '1',
                        isActive: isRating1,
                        onTap: () {
                          setState(() {
                            isRating1 = true;
                            isRating2 = false;
                            isRating3 = false;
                            isRating4 = false;
                            isRating5 = false;
                          });
                        },
                        borderRadius: BorderRadius.only(
                            bottomRight: isRTL()
                                ? const Radius.circular(15)
                                : const Radius.circular(0),
                            topRight: isRTL()
                                ? const Radius.circular(15)
                                : const Radius.circular(0),
                            bottomLeft: isRTL()
                                ? const Radius.circular(0)
                                : const Radius.circular(15),
                            topLeft: isRTL()
                                ? const Radius.circular(0)
                                : const Radius.circular(15))),
                    BuildStartRatingWidget(
                      text: '2',
                      isActive: isRating2,
                      onTap: () {
                        setState(() {
                          isRating1 = false;
                          isRating2 = true;
                          isRating3 = false;
                          isRating4 = false;
                          isRating5 = false;
                        });
                      },
                    ),
                    BuildStartRatingWidget(
                      text: '3',
                      isActive: isRating3,
                      onTap: () {
                        setState(() {
                          isRating1 = false;
                          isRating2 = false;
                          isRating3 = true;
                          isRating4 = false;
                          isRating5 = false;
                        });
                      },
                    ),
                    BuildStartRatingWidget(
                      text: '4',
                      isActive: isRating4,
                      onTap: () {
                        setState(() {
                          isRating1 = false;
                          isRating2 = false;
                          isRating3 = false;
                          isRating4 = true;
                          isRating5 = false;
                        });
                      },
                    ),
                    BuildStartRatingWidget(
                      text: '5',
                      isActive: isRating5,
                      borderRadius: BorderRadius.only(
                          bottomRight: isRTL()
                              ? const Radius.circular(0)
                              : const Radius.circular(15),
                          topRight: isRTL()
                              ? const Radius.circular(0)
                              : const Radius.circular(15),
                          bottomLeft: isRTL()
                              ? const Radius.circular(15)
                              : const Radius.circular(0),
                          topLeft: isRTL()
                              ? const Radius.circular(15)
                              : const Radius.circular(0)),
                      onTap: () {
                        setState(() {
                          isRating1 = false;
                          isRating2 = false;
                          isRating3 = false;
                          isRating4 = false;
                          isRating5 = true;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                SizedBox(
                  height: h * 0.08,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppStrings.applyFilters.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.white, fontSize: FontSize.s22),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
