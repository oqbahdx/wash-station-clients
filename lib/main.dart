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
import 'package:washing_track/presentation/bloc/add_address/add_address_cubit.dart';
import 'package:washing_track/presentation/bloc/bloc_observer.dart';
import 'package:washing_track/presentation/bloc/booking_active_bloc/booking_active_cubit.dart';
import 'package:washing_track/presentation/bloc/booking_waiting_bloc/booking_waiting_cubit.dart';
import 'package:washing_track/presentation/bloc/choose_location_bloc/choose_location_cubit.dart';
import 'package:washing_track/presentation/bloc/find_car_wash_bloc/find_car_wash_cubit.dart';
import 'package:washing_track/presentation/bloc/forgot_password_bloc/forgot_password_cubit.dart';
import 'package:washing_track/presentation/bloc/get_location/get_location_cubit.dart';
import 'package:washing_track/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:washing_track/presentation/bloc/otp_bloc/otp_cubit.dart';
import 'package:washing_track/presentation/bloc/packages_bloc/packages_cubit.dart';
import 'package:washing_track/presentation/bloc/profile_bloc/profile_cubit.dart';
import 'package:washing_track/presentation/bloc/rating_bloc/rating_cubit.dart';
import 'package:washing_track/presentation/bloc/register_bloc/register_cubit.dart';
import 'package:washing_track/presentation/bloc/review_booking_bloc/review_booking_cubit.dart';
import 'package:washing_track/presentation/bloc/schedule_bloc/schedule_cubit.dart';
import 'package:washing_track/presentation/bloc/services_bloc/services_cubit.dart';
import 'package:washing_track/presentation/bloc/services_history/services_history_cubit.dart';
import 'package:washing_track/presentation/bloc/settings_bloc/settings_cubit.dart';
import 'package:washing_track/presentation/bloc/tracking_map_bloc/tracking_map_cubit.dart';
import 'app/app.dart';
import 'app/di.dart';
import 'app/languages_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'client',
      options: const FirebaseOptions(
          apiKey: "AIzaSyAhV5IiJ93DqxrRBlthL1laRdV-LLvPa1g",
          appId: "1:438744050432:android:b759aeb42f343118e321e5",
          messagingSenderId: "438744050432",
          projectId: "washing-machine-application"));
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
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => RegisterCubit()),
      BlocProvider(create: (context) => OtpCubit()),
      BlocProvider(create: (context) => FindCarWashCubit()),
      BlocProvider(create: (context) => AddAddressCubit()),
      BlocProvider(create: (context) => GetLocationCubit()),
      BlocProvider(create: (context) => ChoosePackagesCubit()),
      BlocProvider(create: (context) => ServicesCubit()),
      BlocProvider(create: (context) => ScheduleCubit()),
      BlocProvider(create: (context) => ChooseLocationCubit()),
      BlocProvider(create: (context) => RatingCubit()),
      BlocProvider(create: (context) => ServicesHistoryCubit()),
      BlocProvider(create: (context) => SettingsCubit()),
      BlocProvider(create: (context) => ProfileCubit()),
      BlocProvider(create: (context) => ReviewBookingCubit()),
      BlocProvider(create: (context) => BookingActiveCubit()),
      BlocProvider(create: (context) => BookingWaitingCubit()),
      BlocProvider(create: (context) => TrackingMapCubit()),
      BlocProvider(create: (context) => ForgotPasswordCubit()),
    ],
    child: EasyLocalization(
        supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
        path: ASSET_PATH_LOCALE,
        fallbackLocale: ARABIC_LOCALE,
        child: Phoenix(child: MyApp())),
  ));
  await ScreenUtil.ensureScreenSize();
}

// todo : add configuration for url launcher
// todo : add configuration for notification for ios
