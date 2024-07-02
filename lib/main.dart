import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/app/app_prefs.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/data/network/dio_helper.dart';
import 'package:washing_track/presentation/bloc/bloc_observer.dart';
import 'app/app.dart';
import 'app/di.dart';
import 'app/languages_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await initAppModule();
  Bloc.observer = MyBlocObserver();
  AppPreferences appPreferences = instance<AppPreferences>();
  await DioHelper.init();
  appPreferences.getToken(key: "token").then((value) {
    Constants.token = value ?? "";
  });
  appPreferences.getFirstName(key: 'firstName').then((value) {
    Constants.firstName = value ?? "";
  });
  appPreferences.getLastName(key: 'lastName').then((value) {
    Constants.lastName = value ?? "";
  });
  appPreferences.getPhoneNumber(key: 'phoneNumber').then((value) {
    Constants.phoneNumber = value ?? "";
  });
  appPreferences.getStreetName(key: 'streetName').then((value) {
    Constants.streetName = value ?? "";
  });
  appPreferences.getProfilePicture(key: 'profilePicture').then((value) {
    Constants.profilePicture = value ?? "";
  });
  if (kDebugMode) {
    print("token from main function ${Constants.token}");
  }
  if (kDebugMode) {
    print("name from main function ${Constants.firstName}");
  }
// ignore: missing_provider_scope
  runApp(EasyLocalization(
      supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
      path: ASSET_PATH_LOCALE,
      fallbackLocale: ARABIC_LOCALE,
      child: Phoenix(child: MyApp())));
  await ScreenUtil.ensureScreenSize();
}

// todo : add configuration for url launcher
// todo : add configuration for notification for ios
