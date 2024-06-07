import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/bloc/forgot_password_bloc/forgot_password_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/common_widgets/textField.dart';
import 'package:washing_track/presentation/forgot_password/view/forgot_password_webview.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

TextEditingController? _phoneNumber;
var _key = GlobalKey<FormState>();

class _ForgotPasswordViewState extends State<ForgotPasswordView> {

  @override
  void initState() {
    super.initState();
    _phoneNumber = TextEditingController();
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
        elevation: 0,
        backgroundColor: ColorManager.primary,
        iconTheme: IconThemeData(color: ColorManager.white),
        title: Text(
          AppStrings.forgotPassword.tr(),
          style: getMediumStyle(
              color: ColorManager.white, fontSize: FontSize.s18.sp),
        ),
      ),
      body: BlocConsumer<ForgotPasswordCubit,ForgotPasswordState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = context.read<ForgotPasswordCubit>();
          return SafeArea(
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                  child: Column(
                    children: [
                      const Divider(),
                      SizedBox(
                        height: h * 0.08,
                      ),
                      Text(
                        AppStrings.forgotPasswordTitle.tr(),
                        style: getSemiBoldStyle(
                            color: ColorManager.white, fontSize: FontSize.s22.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: h * 0.08,
                      ),
                      BuildTextField(
                          label: Text(AppStrings.phoneNumber.tr()),
                          controller: _phoneNumber!,
                          keyboardType: TextInputType.phone),
                      SizedBox(
                        height: h * 0.38,
                      ),
                      BuildButton(
                        onPressed: (){
                          // cubit.launchURL();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ForgotPasswordWebView()));
                        },
                        text: AppStrings.send.tr(),
                        color: ColorManager.primary,
                      ),
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
    _phoneNumber!.dispose();
    super.dispose();
  }
}
