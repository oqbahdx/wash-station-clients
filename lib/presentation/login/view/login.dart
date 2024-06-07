import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/bloc/login_bloc/login_cubit.dart';
import 'package:washing_track/presentation/bloc/login_bloc/login_states.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../common_widgets/textField.dart';
import 'login_webview.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final TextEditingController _phoneNumber = TextEditingController();
final TextEditingController _password = TextEditingController();
var _loginKeyForm = GlobalKey<FormState>();

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    context
        .read<LoginCubit>()
        .fToast
        .init(context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery
        .sizeOf(context)
        .height;
    final w = MediaQuery
        .sizeOf(context)
        .width;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          EasyLoading.dismiss();
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.homeRoute, (route) => false);
        }
        if (state is LoginErrorState) {
           if(context.read<LoginCubit>().loginModelError?.message == "Phone Number Verification Required."){
             context.read<LoginCubit>().showCustomToast(
                 messageColor: ColorManager.white,
                 message: AppStrings.phoneVerificationMessage.tr(),
                 color: ColorManager.error);
           }else{
             context.read<LoginCubit>().showCustomToast(
                 messageColor: ColorManager.white,
                 message: AppStrings.phonePasswordInvalid.tr(),
                 color: ColorManager.error);
           }

        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.primary,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.primary,
                  statusBarIconBrightness: Brightness.light),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Form(
                key: _loginKeyForm,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * .05,
                      ),
                      Text(
                        AppStrings.welcome.tr(),
                        style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s40.sp),
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      Align(
                          alignment: isRTL()
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Text(
                            AppStrings.signInToContinue.tr(),
                            style: getSemiBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20.sp),
                          )),
                      SizedBox(
                        height: h * .05,
                      ),
                      BuildTextField(
                        controller: _phoneNumber,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return context
                              .read<LoginCubit>()
                              .validatePhoneNumberInput(value);
                        },
                        label: Text(
                          AppStrings.phoneNumber.tr(),
                        ),
                        // maxLength: 10,
                      ),
                      SizedBox(
                        height: h * .015,
                      ),
                      BuildTextField(
                        controller: _password,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.passwordError.tr();
                          } else {
                            return null;
                          }
                        },
                        label: Text(
                          AppStrings.password.tr(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: h * .05,
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              elevation: 2,
                              surfaceTintColor: ColorManager.white,
                              backgroundColor: ColorManager.primary),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                const ForgotPasswordViewWebView()));
                          },
                          child: Text(
                            AppStrings.forgotPassword.tr(),
                            style: getSemiBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s14.sp),
                          )),
                      SizedBox(
                        height: h * .115,
                      ),
                      state is LoginLoadingState
                          ? const LoadingButton()
                      //0552668738
                          : BuildButton(
                        text: AppStrings.login.tr(),
                        onPressed: () {
                          if (_loginKeyForm.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                                phoneNumber: _phoneNumber.text.trim(),
                                password: _password.text.trim());
                          }
                        },
                      ),
                      SizedBox(
                        height: h * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            AppStrings.doNotHaveAnAccount.tr(),
                            style: getMediumStyle(
                                color: ColorManager.textFormLightGrey,
                                fontSize: FontSize.s18.sp),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.registerRoute);
                            },
                            child: Text(
                              AppStrings.signUp.tr(),
                              style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s18.sp),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _phoneNumber.dispose();
    _password.dispose();
    super.dispose();
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
