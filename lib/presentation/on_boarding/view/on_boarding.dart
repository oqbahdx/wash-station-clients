import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';



import '../../login/view/login.dart';
import '../../resources/color_manager.dart';

import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final introKey = GlobalKey<IntroductionScreenState>();
  // final AppPreferences _appPreferences = instance<AppPreferences>();
  void _onIntroEnd(context) {
    // _appPreferences.setOnBoardingScreenViewed();
    Platform.isAndroid
        ? Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginView()),
    )
        : Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (_) => const LoginView()));
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Lottie.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      safeArea: 20.0,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      pages: [
        PageViewModel(
          title: "AppStrings.attendanceManagement.tr()",

          // AppStrings.attendanceManagementBody.tr(),
          bodyWidget: Text(
            "AppStrings.attendanceManagementBody.tr()",
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s18),
            textAlign: TextAlign.center,
          ),
          // image: _buildImage(JsonManager.checkList),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "AppStrings.linkEasy.tr()",
          bodyWidget: Text(
            "AppStrings.linkEasyBody.tr()",
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s18),
            textAlign: TextAlign.center,
          ),
          // image: _buildImage(JsonManager.nfc),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "AppStrings.location.tr()",
          bodyWidget: Text(
            "AppStrings.locationBody.tr()",
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s18),
            textAlign: TextAlign.center,
          ),
          // image: _buildImage(JsonManager.location),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: Icon(
        Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        color: ColorManager.white,
      ),
      skip: Text("AppStrings.skip.tr()",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: ColorManager.white)),
      next: Icon(
        Platform.isAndroid ? Icons.arrow_forward : Icons.arrow_forward_ios,
        color: ColorManager.white,
      ),
      done: Text("AppStrings.done.tr()",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: ColorManager.white)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator:  DotsDecorator(
        size: const Size(10.0, 10.0),
        color: ColorManager.white,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: ColorManager.primary,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}
