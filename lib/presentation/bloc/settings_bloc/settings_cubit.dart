import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:washing_track/app/app_prefs.dart';

import '../../../app/di.dart';
import '../../common_widgets/settings_items.dart';
import '../../login/view/login.dart';
import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  final AppPreferences _appPreferences = instance<AppPreferences>();

  showAlertDialogAndroid(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        AppStrings.logout.tr(),
        style: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s16.sp),
      ),
      content: Text(
        AppStrings.logoutMessage.tr(),
        style: getMediumStyle(
            color: ColorManager.black, fontSize: FontSize.s14.sp),
      ),
      actions: [
        LogOutsButtonDialog(
            text: AppStrings.logout.tr(),
            color: ColorManager.error,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginView()),
                  (route) => false);
              _appPreferences.setToken(key: 'token', value: '');
            }),
        LogOutsButtonDialog(
            text: AppStrings.cancel.tr(),
            color: ColorManager.lightPrimary,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogIos(BuildContext context) {
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(
        AppStrings.logout.tr(),
        style: getSemiBoldStyle(
            color: ColorManager.primary, fontSize: FontSize.s16.sp),
      ),
      content: Text(
        AppStrings.logoutMessage.tr(),
        style: getMediumStyle(
            color: ColorManager.black, fontSize: FontSize.s14.sp),
      ),
      actions: [
        LogOutsButtonDialog(
            text: AppStrings.logout.tr(),
            color: ColorManager.error,
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginView()),
                  (route) => false);
              _appPreferences.setToken(key: 'token', value: '');
            }),
        LogOutsButtonDialog(
            text: AppStrings.cancel.tr(),
            color: ColorManager.lightPrimary,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void changeLanguageToArabic(BuildContext context){
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
    context.setLocale(const Locale('ar', 'SA'));
    emit(ChangeLanguageState());
  }
  void changeLanguageToEnglish(BuildContext context){
    _appPreferences.changeAppLanguage();
    context.setLocale(const Locale('en', 'US'));
    Phoenix.rebirth(context);
    emit(ChangeLanguageState());
  }

}
