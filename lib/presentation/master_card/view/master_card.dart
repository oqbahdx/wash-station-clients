import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:washing_track/presentation/bloc/packages_bloc/packages_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
import '../../common_widgets/payment_items.dart';

class MasterCardView extends StatefulWidget {
  const MasterCardView({super.key});

  @override
  State<MasterCardView> createState() => _MasterCardViewState();
}

TextEditingController? _cardNumberController;
TextEditingController? _cardHolderController;
TextEditingController? _cardExpiresController;
TextEditingController? _carCVCController;
TextEditingController? _fullNameController;
TextEditingController? _phoneNumberController;
TextEditingController? _emailController;

class _MasterCardViewState extends State<MasterCardView> {
  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController();
    _cardHolderController = TextEditingController();
    _cardExpiresController = TextEditingController();
    _carCVCController = TextEditingController();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery
        .sizeOf(context)
        .height;
    final w = MediaQuery
        .sizeOf(context)
        .width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorManager.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light
        ),
        elevation: 0,
        title: Text(
          AppStrings.paymentMethods.tr(),
          style: getBoldStyle(
              color: ColorManager.white, fontSize: FontSize.s25.sp),
        ),
        // centerTitle: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: w * .04,
              child: SizedBox(
                height: AppSize.s70.h,
                width: w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppSize.s40.w,
                    ),
                    Text(
                      AppStrings.masterCard.tr(),
                      style: getSemiBoldStyle(
                          color: ColorManager.white, fontSize: FontSize.s16.sp),
                    ),
                    SizedBox(
                      width: AppSize.s10.w,
                    ),
                    SvgPicture.asset(IconsAssets.masterCardIc),
                    const Spacer(),
                    OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorManager.white),
                            foregroundColor:
                            MaterialStateProperty.all(ColorManager.primary)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.cancel)),
                  ],
                ),
              ),
            ),
            Positioned(
                top: h * .1,
                left: w * .04,
                child: SizedBox(
                    height: h * .1,
                    width: w * .9,
                    child: CustomTextFormField(
                      keyboardType: TextInputType.number,
                      textColor: ColorManager.white,
                      borderColor: ColorManager.grey,
                      labelText: AppStrings.cardNumber.tr(),
                      labelStyle: getRegularStyle(
                          color: ColorManager.white, fontSize: FontSize.s16.sp),
                      suffixText: "8364 9375 0930 7302",
                      suffixStyle:
                      getRegularStyle(color: ColorManager.textFormDarkGrey),
                    ))),
            Positioned(
                top: h * .18,
                left: w * .04,
                child: SizedBox(
                    height: h * .1,
                    width: w * .9,
                    child: CustomTextFormField(
                      keyboardType: TextInputType.name,
                      textColor: ColorManager.white,
                      borderColor: ColorManager.grey,
                      labelText: AppStrings.cardHolder.tr(),
                      labelStyle: getRegularStyle(
                          color: ColorManager.white, fontSize: FontSize.s16.sp),
                      suffixText: AppStrings.suffixText.tr(),
                      suffixStyle:
                      getRegularStyle(color: ColorManager.textFormDarkGrey),
                    ))),
            Positioned(
              top: h * .25,
              left: w * .04,
              child: SizedBox(
                  height: h * .1,
                  width: w * .45,
                  child: CustomTextFormField(
                    keyboardType: TextInputType.number,
                    textColor: ColorManager.white,
                    borderColor: ColorManager.grey,
                    labelText: AppStrings.expires.tr(),
                    labelStyle: getRegularStyle(
                        color: ColorManager.white, fontSize: FontSize.s16.sp),
                    suffixText: "12/21",
                    suffixStyle:
                    getRegularStyle(color: ColorManager.textFormDarkGrey),
                  )),
            ),
            Positioned(
              top: h * .25,
              right: w * .04,
              child: SizedBox(
                  height: h * .1,
                  width: w * .45,
                  child: CustomTextFormField(
                    keyboardType: TextInputType.number,
                    textColor: ColorManager.white,
                    borderColor: ColorManager.grey,
                    labelText: "CVC",
                    labelStyle: getRegularStyle(
                        color: ColorManager.white, fontSize: FontSize.s16.sp),
                    suffixText: "123",
                    suffixStyle:
                    getRegularStyle(color: ColorManager.textFormDarkGrey),
                  )),
            ),
            Positioned(
              top: h * .35,
              child: Container(
                alignment: Alignment.center,
                height: h,
                width: w,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),

              ),
            ),
            Positioned(
                top: h * .36,
                left: w * .04,
                child: Text(
                  AppStrings.yourInformation.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s16.sp),
                )),
            Positioned(
                top: h * .4,
                left: w * .04,
                child: SizedBox(
                    height: h * .1,
                    width: w * .9,
                    child: CustomTextFormField(
                      keyboardType: TextInputType.name,
                      textColor: ColorManager.black,
                      borderColor: ColorManager.grey,
                      labelText: AppStrings.fullName.tr(),
                      labelStyle: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s16.sp),
                      suffixText: AppStrings.suffixText.tr(),
                      suffixStyle: getRegularStyle(color: ColorManager.grey),
                    ))),
            Positioned(
                top: h * .48,
                left: w * .04,
                child: SizedBox(
                    height: h * .1,
                    width: w * .9,
                    child: CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      textColor: ColorManager.black,
                      borderColor: ColorManager.grey,
                      labelText: AppStrings.phoneNumber.tr(),
                      labelStyle: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s16.sp),
                      suffixText: "050xxxxxxx",
                      suffixStyle: getRegularStyle(color: ColorManager.grey),
                    ))),
            Positioned(
                top: h * .55,
                left: w * .04,
                child: SizedBox(
                    height: h * .1,
                    width: w * .9,
                    child: CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textColor: ColorManager.black,
                      borderColor: ColorManager.grey,
                      labelText: AppStrings.email.tr(),
                      labelStyle: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s16.sp),
                      suffixText: "user@mail.com",
                      suffixStyle: getRegularStyle(color: ColorManager.grey),
                    ))),
            Positioned(
              top: h * .66,
              left: w * .05,
              child: Container(
                alignment: Alignment.center,
                // height: h *.08,
                width: w * .9,
                decoration: BoxDecoration(
                    color: ColorManager.textFormLightGrey,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.total.tr(),
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s16.sp),
                          ),
                          Text(
                            "${context.read<ChoosePackagesCubit>().servicesList.length} ${AppStrings.services.tr()}",
                            style: getRegularStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s16.sp),
                          ),
                        ],
                      ),
                      Text(
                        "${AppStrings.riyal.tr()} ${context.read<ChoosePackagesCubit>().total}",
                        style: getRegularStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s16.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: h * .78,
              child: BuildButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.successRoute);
                },
                text: AppStrings.confirm.tr(),),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cardNumberController!.dispose();
    _cardHolderController!.dispose();
    _cardExpiresController!.dispose();
    _carCVCController!.dispose();
    _fullNameController!.dispose();
    _phoneNumberController!.dispose();
    _emailController!.dispose();
    super.dispose();
  }
}
