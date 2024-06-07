import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:washing_track/app/app_prefs.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/app/di.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

class SelectLanguagesView extends StatefulWidget {
  const SelectLanguagesView({super.key});

  @override
  State<SelectLanguagesView> createState() => _SelectLanguagesViewState();
}

final AppPreferences _appPreferences = instance<AppPreferences>();

class _SelectLanguagesViewState extends State<SelectLanguagesView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * .1,
              ),
              SizedBox(
                height: h * .1,
              ),
              Text(
                "${AppStrings.hi.tr()}, ${Constants.firstName}",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s25.sp),
              ),
              SizedBox(
                height: h * .1,
              ),
              Text(
                AppStrings.selectLanguageMessage.tr(),
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.s17.sp),
              ),
              SizedBox(
                height: h * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  !isRTL()
                      ? SvgPicture.asset(
                          IconsAssets.checksIc,
                          height: w * .07,
                          width: w * .07,
                        )
                      : InkWell(
                          splashColor: ColorManager.transparent,
                          highlightColor: ColorManager.transparent,
                          onTap: () {
                            _appPreferences.changeAppLanguage();
                            context.setLocale(const Locale('en', 'US'));
                            debugPrint("english");
                          },
                          child: Container(
                            height: w * .07,
                            width: w * .07,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorManager.black)),
                          ),
                        ),
                  Text(
                    AppStrings.english,
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s14.sp),
                  ),
                  SizedBox(
                    width: h * .01,
                  ),
                  isRTL()
                      ? SvgPicture.asset(
                          IconsAssets.checksIc,
                          height: w * .07,
                          width: w * .07,
                        )
                      : InkWell(
                          splashColor: ColorManager.transparent,
                          highlightColor: ColorManager.transparent,
                          onTap: () {
                            _appPreferences.changeAppLanguage();
                            context.setLocale(const Locale('ar', 'SA'));
                            debugPrint("arabic");
                          },
                          child: Container(
                            height: w * .07,
                            width: w * .07,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorManager.black)),
                          ),
                        ),
                  Text(AppStrings.arabic,
                      style: getRegularStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s14.sp)),
                ],
              ),
              SizedBox(
                height: h * .2,
              ),
              BuildButton(
                text: AppStrings.select.tr(),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.getLocationRoute, (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
