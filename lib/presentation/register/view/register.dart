import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/common_widgets/textField.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../../app/languages_manager.dart';
import '../../bloc/register_bloc/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

FirebaseMessaging messaging = FirebaseMessaging.instance;

String token = "";

TextEditingController? _firstName;

TextEditingController? _lastName;

TextEditingController? _phoneNumber;

TextEditingController? _password;

var _key = GlobalKey<FormState>();
File? _image;

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
    messaging.getToken().then((value) {
      token = value ?? "";
      if (kDebugMode) {
        print("token : $token");
      }
    });
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _phoneNumber = TextEditingController();
    _password = TextEditingController();
    context.read<RegisterCubit>().fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: ColorManager.primary,
        iconTheme: IconThemeData(color: ColorManager.white),
        elevation: 0.0,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (context
                .read<RegisterCubit>()
                .registerModelError
                ?.validationError ==
                "The phone number is already registered. Please use a different one.") {
              context.read<RegisterCubit>().showCustomToast(
                  messageColor: ColorManager.white,
                  message: AppStrings.phoneUsedMessage.tr(),
                  color: ColorManager.error);
            }
            if (context.read<RegisterCubit>().registerModel!.phoneNumber ==
                _phoneNumber!.text.replaceFirst('0', '+971')) {
              Navigator.pushNamed(context, Routes.otpRoute,
                  arguments: _phoneNumber!.text);
            }
          }
          if (state is RegisterErrorState) {

            context.read<RegisterCubit>().showCustomToast(
                messageColor: ColorManager.white,
                message: AppStrings.phonePasswordInvalid.tr(),
                color: ColorManager.error);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: isRTL()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          AppStrings.welcome.tr(),
                          style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s40.sp),
                        ),
                      ),
                      Align(
                        alignment: isRTL()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          AppStrings.signUpToJoin.tr(),
                          style: getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18.sp),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      BuildTextField(
                        controller: _firstName!,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return context
                              .read<RegisterCubit>()
                              .validateFirstNameInput(value);
                        },
                        label: Text(
                          AppStrings.firstName.tr(),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      BuildTextField(
                        controller: _lastName!,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return context
                              .read<RegisterCubit>()
                              .validateLastNameInput(value);
                        },
                        label: Text(
                          AppStrings.lastName.tr(),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      BuildTextField(
                        controller: _phoneNumber!,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return context
                              .read<RegisterCubit>()
                              .validatePhoneNumberInput(value);
                        },
                        label: Text(
                          AppStrings.phoneNumber.tr(),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      BuildTextField(
                        controller: _password!,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return context
                              .read<RegisterCubit>()
                              .validatePasswordInput(value);
                        },
                        label: Text(
                          AppStrings.password.tr(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: h * 0.08,
                      ),
                      state is RegisterLoadingState
                          ? const LoadingButton()
                          // 0552668738
                          : BuildButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  context.read<RegisterCubit>().register(
                                      firstName: _firstName!.text.trim(),
                                      lastName: _lastName!.text.trim(),
                                      phoneNumber: _phoneNumber!.text.trim(),
                                      password: _password!.text.trim(),
                                      token: token.trim());
                                }
                              },
                              text: AppStrings.register.tr())
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _firstName!.dispose();
    _lastName!.dispose();
    _phoneNumber!.dispose();
    _password!.dispose();
    super.dispose();
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
