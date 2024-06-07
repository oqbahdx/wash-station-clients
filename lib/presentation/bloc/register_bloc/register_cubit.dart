import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/data/network/dio_helper.dart';
import 'package:washing_track/domain/register_model/register_model.dart';

import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
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
        style: getBoldStyle(color: messageColor),
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
            style: getBoldStyle(color: ColorManager.black,fontSize: AppSize.s14.sp),
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

  RegisterModel? registerModel;
  RegisterModelError? registerModelError;
  Future register(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password,
      required String token,
      }) async {
    emit(RegisterLoadingState());
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      DioHelper.postData(endPoint: Constants.registerEndPoint, data: {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber.replaceFirst('0', '+971'),
        "password": password,
        "fcm_token": token,
      }).then((value) {
        registerModel = RegisterModel.fromJson(value!.data);
        registerModelError = RegisterModelError.fromJson(value.data);
        emit(RegisterSuccessState());
        debugPrint("SSSSSSSSSSSSSSSSS");
      }).catchError((error) {
        debugPrint(error.toString());
        debugPrint("EEEEEEEEEEEEEEEEE");
        emit(RegisterErrorState(error.toString()));
      });
    } else {
      showNoInternetMessage();
    }
  }

  bool containsOnlyNumbers(String input) {
    final RegExp numberRegex = RegExp(r'^[0-9]+$');
    return numberRegex.hasMatch(input);
  }

  bool containsOnlyStrings(String input) {
    final RegExp stringRegex =
        RegExp(r'[!@#\$%^&*(),.?":{}|<>0-9]');
    return stringRegex.hasMatch(input);
  }

  String? validatePhoneNumberInput(String? value) {
    if (value!.isEmpty) {
      return AppStrings.phoneError.tr();
    } else if (value.length < 10) {
      return AppStrings.phoneShortError.tr();
    }if(!value.startsWith("05")){
      return AppStrings.numberInvalid.tr();
    } else if (!containsOnlyNumbers(value)) {
      return AppStrings.numberInvalid.tr();
    } else {
      return null;
    }
  }

  String? validateFirstNameInput(String? value) {
    if (value!.isEmpty) {
      return AppStrings.firstNameError.tr();
    } else if (value.length < 2) {
      return AppStrings.nameShortError.tr();
    } else if (containsOnlyStrings(value)) {
      return AppStrings.nameInvalid.tr();
    } else {
      return null;
    }
  }

  String? validateLastNameInput(String? value) {
    if (value!.isEmpty) {
      return AppStrings.lastNameError.tr();
    } else if (value.length < 2) {
      return AppStrings.nameShortError.tr();
    } else if (containsOnlyStrings(value)) {
      return AppStrings.nameInvalid.tr();
    } else {
      return null;
    }
  }

  String? validatePasswordInput(String? value) {
    if (value!.isEmpty) {
      return AppStrings.passwordError.tr();
    } else {
      return null;
    }
  }
}
