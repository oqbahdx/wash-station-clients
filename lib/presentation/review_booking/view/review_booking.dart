import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/presentation/bloc/packages_bloc/packages_cubit.dart';
import 'package:washing_track/presentation/bloc/review_booking_bloc/review_booking_cubit.dart';
import 'package:washing_track/presentation/bloc/schedule_bloc/schedule_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
import '../../common_widgets/review_booking_items.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class ReviewBookingView extends StatefulWidget {
  const ReviewBookingView({super.key});

  @override
  State<ReviewBookingView> createState() => _ReviewBookingViewState();
}

class _ReviewBookingViewState extends State<ReviewBookingView> {
  Position? _currentPosition;

  Future<void> _getLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("Latitude: ${_currentPosition?.latitude}");
      print("Longitude: ${_currentPosition?.longitude}");
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    _getLocation();
  }
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: ColorManager.primary,
        elevation: 0.0,
        iconTheme: IconThemeData(color: ColorManager.white),
        title: Text(
          AppStrings.reviewBooking.tr(),
          style: getBoldStyle(
              color: ColorManager.white, fontSize: FontSize.s30.sp),
        ),
      ),
      body: BlocConsumer<ReviewBookingCubit, ReviewBookingState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: ListView(
                children: [
                  SizedBox(
                    height: h * .01,
                  ),
                  BuildReviewBookingCard(child: [
                    Text(
                      AppStrings.dateAndTime.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s20.sp),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Text(
                      context.read<ScheduleCubit>().newSelectedDay.toString().split(" ").first,
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s18.sp),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Text(
                      context.read<ScheduleCubit>().selectedTime!,
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s18.sp),
                    ),
                  ]),
                  const Divider(
                    thickness: 2,
                  ),
                  BuildReviewBookingCard(child: [
                    Text(
                      AppStrings.location.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s20.sp),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Text(
                      Constants.streetName,
                      style: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s18.sp),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    // Text(
                    //   "شارع المنزل - الحي ",
                    //   style: getMediumStyle(
                    //       color: ColorManager.black, fontSize: FontSize.s18.sp),
                    // ),
                  ]),
                  const Divider(
                    thickness: 2,
                  ),
                  BuildReviewBookingCard(child: [
                    Text(
                      AppStrings.paymentMethods.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s20.sp),
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    SvgPicture.asset(IconsAssets.appleIc)
                  ]),
                  const Divider(
                    thickness: 2,
                  ),
                  BuildReviewBookingCard(child: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.services.tr(),
                          style: getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s20.sp),
                        ),
                        Text(
                          context.read<ChoosePackagesCubit>().mainService,
                          style: getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s20.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Column(
                      children: context.read<ChoosePackagesCubit>().servicesList,
                    )
                  ]),
                  const Divider(
                    thickness: 2,
                  ),
                  Card(
                    elevation: 5.0,
                    child: Container(
                      height: h * .05,
                      color: ColorManager.primary,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.total.tr(),
                              style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s20.sp),
                            ),
                            Text(
                              '${context.read<ChoosePackagesCubit>().total} ${AppStrings.riyal.tr()} ',
                              style: getSemiBoldStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s20.sp),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  BuildButton(
                    text: AppStrings.confirm.tr(),
                    onPressed: () {
                      print("lat : ${_currentPosition?.latitude}");
                      print("long : ${_currentPosition?.longitude}");
                      // context.read<ReviewBookingCubit>().serviceRequest(
                      //     serviceType: "",
                      //     preferredTime: "preferredTime",
                      //     lat: "${_latLng?.latitude}",
                      //     long: "${_latLng?.longitude}");
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, Routes.successRoute, (route) => false);
                      Navigator.pushNamed(context, Routes.selectPaymentWayRoute);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
