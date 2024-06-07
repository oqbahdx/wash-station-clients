import 'package:flutter/material.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Column(
        children: [
          SizedBox(height: 30,),
          Image.asset(ImageAssets.logo,color: Colors.orange,),
          SizedBox(height: 100,),
          Center(
            child: Text(
              "Splash screen",
              style: getSemiBoldStyle(
                  color: ColorManager.white, fontSize: FontSize.s40),
            ),
          ),
        ],
      ),
    );
  }
}
