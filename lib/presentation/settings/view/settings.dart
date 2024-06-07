import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/bloc/settings_bloc/settings_cubit.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';

import '../../common_widgets/settings_items.dart';
import '../../resources/style_manager.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: ColorManager.white,
        elevation: 0,
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<SettingsCubit>();
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Text(
                AppStrings.settings.tr(),
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s30),
              ),
              SizedBox(
                height: h * .1,
              ),
              // Text(
              //   AppStrings.account.tr(),
              //   style: getSemiBoldStyle(
              //       color: ColorManager.black, fontSize: FontSize.s18.sp),
              // ),

              BuildSettingAccountItems(
                w: w,
                text: AppStrings.changePassword.tr(),
                iconPath: IconsAssets.lockIc,
              ),
              const Divider(),
              BuildSettingAccountItems(
                w: w,
                text: AppStrings.notification.tr(),
                iconPath: IconsAssets.notificationIc,
              ),
              const Divider(),
              BuildSettingAccountItems(
                w: w,
                text: AppStrings.privacySettings.tr(),
                iconPath: IconsAssets.handIc,
              ),
              const Divider(),
              InkWell(
                hoverColor: ColorManager.transparent,
                splashColor: ColorManager.transparent,
                onTap: () {
                  !isRTL()
                      ? cubit.changeLanguageToArabic(context)
                      : cubit.changeLanguageToEnglish(context);
                },
                child: BuildSettingAccountItems(
                    w: w,
                    text: isRTL()
                        ? AppStrings.changeLanguageEnglish.tr()
                        : AppStrings.changeLanguageArabic.tr(),
                    iconPath: IconsAssets.translateIc),
              ),
              const Divider(),
              InkWell(
                hoverColor: ColorManager.transparent,
                splashColor: ColorManager.transparent,
                onTap: () {
                  Platform.isAndroid
                      ? cubit.showAlertDialogAndroid(context)
                      : cubit.showAlertDialogIos(context);
                },
                child: BuildSettingAccountItems(
                  w: w,
                  text: AppStrings.signOut.tr(),
                  iconPath: IconsAssets.logoutIc,
                ),
              )
            ]),
          ));
        },
      ),
    );
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
