import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/bloc/rating_bloc/rating_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/common_widgets/rating_items.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

class RatingView extends StatefulWidget {
  const RatingView({super.key});

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  final TextEditingController _controller = TextEditingController();
  String rateValue = "";

  // todo: get worker id
  @override
  void initState() {
    super.initState();
    context.read<RatingCubit>().fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.primary,
              statusBarIconBrightness: Brightness.light),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  left: isRTL() ? AppPadding.p12 : 0,
                  right: !isRTL() ? AppPadding.p12 : 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                      color: ColorManager.error,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    AppStrings.cancel.tr(),
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: FontSize.s16.sp),
                  ),
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: ColorManager.white,
          title: Text(
            AppStrings.rating.tr(),
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s40.sp),
          ),
        ),
        body: BlocConsumer<RatingCubit, RatingState>(
          listener: (context, state) {
            if (state is LoadingRateState) {
              EasyLoading.show(
                  status: AppStrings.loading.tr(), dismissOnTap: false);
              EasyLoading.instance.maskColor = ColorManager.primary;
            }
            if (state is SuccessRateState) {
              EasyLoading.dismiss();
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeRoute, (route) => false);
            }
            if (state is ErrorRateState) {
              EasyLoading.dismiss();
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * .1,
                    ),
                    Text(
                      AppStrings.ratingMessage.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s20.sp),
                    ),
                    SizedBox(
                      height: h * .1,
                    ),
                    Center(
                      child: RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: ColorManager.primary,
                        ),
                        onRatingUpdate: (rating) {
                          if (kDebugMode) {
                            // print(rating);
                            rateValue = "$rating";
                            print("new value : $rateValue ");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: h * .1,
                    ),
                    Align(
                        alignment: isRTL()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          AppStrings.optional.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s14.sp),
                        )),
                    SizedBox(
                      height: h * .01,
                    ),
                    BuildRatingTextField(
                      label: Text(AppStrings.addComment.tr()),
                      controller: _controller,
                    ),
                    SizedBox(
                      height: h * .1,
                    ),
                    BuildButton(
                      text: AppStrings.send.tr(),
                      onPressed: () {
                        //todo: get worker id
                        context.read<RatingCubit>().rateTheWorker(
                            clientId: "",
                            workerId: "",
                            notes: "",
                            rate: "");
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
