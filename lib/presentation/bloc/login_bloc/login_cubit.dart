import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:washing_track/domain/login_model/login_model.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import '../../../app/app_prefs.dart';
import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../../data/network/dio_helper.dart';

import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';

import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  final AppPreferences _appPreferences = instance<AppPreferences>();
  FToast fToast = FToast();

  showCustomToast(
      {required String message,
      required Color color,
      Color messageColor = Colors.black}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        color: color,
      ),
      child: Text(
        message,
        style: getBoldStyle(color: messageColor, fontSize: FontSize.s14.sp),
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  showNoInternetMessage() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        color: ColorManager.textFormDarkGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            AppStrings.noInternetConnection.tr(),
            style: getBoldStyle(
                color: ColorManager.black, fontSize: AppSize.s14.sp),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  LoginModel? loginModel;
 LoginModelError? loginModelError;
  Future<void> login(
      {required String phoneNumber, required String password}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      emit(LoginLoadingState());
      DioHelper.postData(endPoint: Constants.loginEndPoint, data: {
        "phone_number": "+97${phoneNumber.replaceFirst("0", "1")}",
        "password": password,
      }).then((value) {
        loginModel = LoginModel.fromJson(value!.data);
        loginModelError = LoginModelError.fromJson(value.data);
        if (kDebugMode) {
          print("token : ${loginModel!.token}");
        }
        _appPreferences.setToken(
            key: 'token', value: loginModel!.token.toString());
        if (kDebugMode) {
          print("token : ${loginModel!.user?.id}");
        }
        _appPreferences.setFirstName(
            key: 'firstName', value: loginModel!.user!.firstName.toString());
        _appPreferences.setLastName(
            key: 'lastName', value: loginModel!.user!.lastName.toString());
        _appPreferences.setPhoneNumber(
            key: 'phoneNumber',
            value: loginModel!.user!.phoneNumber.toString());
        _appPreferences.setProfilePicture(
            key: 'profilePicture',
            value: loginModel!.user!.clientPicture.toString());
        _appPreferences.getToken(key: 'token').then((value) {
          Constants.token = value ?? "";
        });
        _appPreferences.getFirstName(key: 'firstName').then((value) {
          Constants.firstName = value ?? "";
        });
        _appPreferences.getLastName(key: 'lastName').then((value) {
          Constants.lastName = value ?? "";
        });
        _appPreferences.getPhoneNumber(key: 'phoneNumber').then((value) {
          Constants.phoneNumber = value ?? "";
        });
        _appPreferences
            .getProfilePicture(key: 'profilePicture')
            .then((value) {
              Constants.profilePicture = value ?? "";
        });
        if (kDebugMode) {
          print("token from login cubit 1 ${Constants.token}");
        }
        if (kDebugMode) {
          print("user if from login cubit 1 ${Constants.userId}");
        }
        if (kDebugMode) {
          print("token from login cubit 2 ${Constants.token}");
          print("user id from login cubit 2 ${Constants.userId}");
        }
        emit(LoginSuccessState());
      }).catchError((error) {
        emit(LoginErrorState(error.toString()));
        // loginModelError = LoginModelError.fromJson(error.toString() as Map<String, dynamic>);
        if (kDebugMode) {
          print("login model error : ${loginModelError!.message}");

        }
        if (kDebugMode) {
          print(error.toString());
          print("*******EEEEEEE******");
        }
      });
    } else {
      showNoInternetMessage();
    }
  }

  bool containsOnlyNumbers(String input) {
    final RegExp numberRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>0-9]');
    return numberRegex.hasMatch(input);
  }

  String? validatePhoneNumberInput(String? value) {
    if (value!.isEmpty) {
      return AppStrings.phoneError.tr();
    } else if (value.length < 10) {
      return AppStrings.phoneShortError.tr();
    }
    if (!value.startsWith("05")) {
      return AppStrings.numberStart05.tr();
    } else if (!containsOnlyNumbers(value)) {
      return AppStrings.numberInvalid.tr();
    } else {
      return null;
    }
  }
}
