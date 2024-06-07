import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:washing_track/presentation/car_wash_details/view/car_wash_details.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';

import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

import '../../common_widgets/car_wash.dart';
import '../../common_widgets/list_tile.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: h * 0.01),
              Row(
                children: [
                  SvgPicture.asset(IconsAssets.smallMarkerIc),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.yourLocation.tr(),
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: FontSize.s14),
                      ),
                      Text(
                        "Brooklyn, New York City",
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(Routes.findCarWashRoute);
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              CarouselSlider(
                options: CarouselOptions(height: h * 0.22, autoPlay: true),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        elevation: 5.0,
                        color: ColorManager.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(ImageAssets.home1),
                                    fit: BoxFit.fill),
                                gradient: LinearGradient(
                                    colors: [
                                      ColorManager.textFormDarkGrey,
                                      ColorManager.grey,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Richard’s Autospa",
                                  style: getMediumStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s12),
                                ),
                                Text(
                                  "Car Wash & Detailing",
                                  style: getBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s28),
                                ),
                                Text(
                                  "Get 30% off",
                                  style: getBoldStyle(
                                      color: const Color(0xFF4CD964),
                                      fontSize: FontSize.s17),
                                ),
                              ],
                            )),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: h * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.popularCarWash.tr(),
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s17),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.seeAll.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.grey, fontSize: FontSize.s12),
                      ))
                ],
              ),
              SizedBox(
                height: h * .005,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      BuildCarWashItems(
                        tag: '1',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CarWashDetails()));
                        },
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                       BuildCarWashItems(
                        tag: '2',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CarWashDetails()));
                        },
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                       BuildCarWashItems(
                        tag: '3',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CarWashDetails()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Container(
                height: h * 0.045,
                decoration: BoxDecoration(
                    color: ColorManager.textFormLightGrey,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppStrings.topRated.tr(),
                      style: getRegularStyle(
                          color: ColorManager.grey, fontSize: FontSize.s16),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down_sharp)),
                    const VerticalDivider(
                      thickness: 1.0,
                    ),
                    SvgPicture.asset(IconsAssets.mapIc),
                    Text(
                      AppStrings.map.tr(),
                      style: getRegularStyle(
                          color: ColorManager.grey, fontSize: FontSize.s16),
                    ),
                    const VerticalDivider(
                      thickness: 1.0,
                    ),
                    SvgPicture.asset(IconsAssets.filterIc),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.filterRoute);
                      },
                      child: Text(
                        AppStrings.filter.tr(),
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: FontSize.s16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              BuildListTile(
                h: h * .1,
                w: w * .2,
                h1: h * .1,
              ),
              BuildListTile(
                h: h * .1,
                w: w * .2,
                h1: h * .1,
              ),
              BuildListTile(
                h: h * .1,
                w: w * .2,
                h1: h * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
