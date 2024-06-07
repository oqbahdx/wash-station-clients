import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:washing_track/app/app_prefs.dart';
import 'package:washing_track/app/di.dart';
import 'package:washing_track/data/network/dio_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:washing_track/domain/update_profile_model/update_profile_model.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

import '../../../app/constants.dart';
import '../../resources/value_manager.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  FToast fToast = FToast();
  final AppPreferences appPreferences = instance<AppPreferences>();

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

  File? image;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? newImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (newImage != null) {
      image = File(newImage.path);
      emit(PickImageState());
    }
  }

  deleteImage() {
    image = null;
    emit(DeleteImageState());
  }

  updateProfile(
      {String? firstName, String? lastName, String? phoneNumber}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      emit(LoadingUpdateProfileState());
      DioHelper.postData(endPoint: Constants.updateEndPoint, data: {
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber?.replaceFirst('0', '+971')
      }).then((value) {
        updateProfileModel = UpdateProfileModel.fromJson(value!.data);
        appPreferences.setFirstName(
            key: 'firstName',
            value: updateProfileModel!.user!.firstName.toString());
        appPreferences.setFirstName(
            key: 'lastName',
            value: updateProfileModel!.user!.lastName.toString());
        appPreferences.setFirstName(
            key: 'phoneNumber',
            value: updateProfileModel!.user!.phoneNumber.toString());
        appPreferences.getFirstName(key: 'firstName').then((value) {
          Constants.firstName = value ?? "";
        });
        appPreferences.getLastName(key: 'lastName').then((value) {
          Constants.lastName = value ?? "";
        });
        appPreferences.getPhoneNumber(key: 'phoneNumber').then((value) {
          Constants.phoneNumber = value ?? "";
        });
        emit(SuccessUpdateProfileState());
      }).catchError((error) {
        emit(ErrorUpdateProfileState(error.toString()));
      });
    } else {
      showNoInternetMessage();
    }
  }

  UpdateProfileModel? updateProfileModel;

  updateProfileWithImage(
      {String? firstName, String? lastName, String? phoneNumber}) async {
    emit(LoadingUpdateProfileState());
    DioHelper.postDataWithImage(
        endPoint: Constants.updateEndPoint,
        data: FormData.fromMap({
          'first_name': firstName,
          'last_name': lastName,
          'phone_number': phoneNumber?.replaceFirst('0', '+971'),
          "client_picture": await MultipartFile.fromFile(image!.path,
              filename: image!.path.split('/').last)
        })
        // todo : add image url
        ).then((value) {
      updateProfileModel = UpdateProfileModel.fromJson(value!.data);
      appPreferences.setFirstName(
          key: 'firstName',
          value: updateProfileModel!.user!.firstName.toString());
      appPreferences.setFirstName(
          key: 'lastName',
          value: updateProfileModel!.user!.lastName.toString());
      appPreferences.setFirstName(
          key: 'phoneNumber',
          value: updateProfileModel!.user!.phoneNumber.toString());
      appPreferences.setProfilePicture(key: 'profilePicture', value: updateProfileModel!.user!.clientPicture.toString());
      appPreferences.getProfilePicture(key: 'profilePicture').then((value){
        Constants.profilePicture = value ?? "";
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
      emit(SuccessUpdateProfileState());
    }).catchError((error) {
      emit(ErrorUpdateProfileState(error.toString()));
    });
  }

  changeLangToArabic(BuildContext context) {
    appPreferences.changeAppLanguage();
    context.setLocale(const Locale('ar', 'SA'));
    emit(UpdateLanguage());
  }

  changeLangToEnglish(BuildContext context) {
    appPreferences.changeAppLanguage();
    context.setLocale(const Locale('en', 'US'));
    emit(UpdateLanguage());
  }

  logout() {
    appPreferences.setUserId(key: 'userId', value: '');
    appPreferences.setToken(key: 'token', value: '');
    appPreferences.setFirstName(key: 'firstName', value: '');
    appPreferences.setLastName(key: 'lastName', value: '');
    appPreferences.setPhoneNumber(key: 'phoneNumber', value: '');
    emit(LogoutState());
  }

  showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Theme.of(context).platform == TargetPlatform.iOS) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: CupertinoAlertDialog(
              title: Text(AppStrings.logout.tr()),
              content: Text(AppStrings.logoutMessage.tr()),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    AppStrings.cancel.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    AppStrings.confirm.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.error, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
                    logout();
                  },
                ),
              ],
            ),
          );
        } else {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
              title: Text(AppStrings.logout.tr()),
              content: Text(AppStrings.logoutMessage.tr()),
              actions: [
                ElevatedButton(
                  child: Text(
                    AppStrings.cancel.tr(),
                    style: getSemiBoldStyle(
                        color: CupertinoColors.white, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.error),
                  child: Text(
                    AppStrings.confirm.tr(),
                    style: getSemiBoldStyle(
                        color: CupertinoColors.white, fontSize: FontSize.s16),
                  ),
                  onPressed: () {
                    // logout action
                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
                    logout();
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
