import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/choose_packages/view/choose_packages.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../choose_services/view/choose_services.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/style_manager.dart';

class ChoosePackagesAndServicesView extends StatefulWidget {
  const ChoosePackagesAndServicesView({super.key});

  @override
  State<ChoosePackagesAndServicesView> createState() =>
      _ChoosePackagesAndServicesViewState();
}

class _ChoosePackagesAndServicesViewState
    extends State<ChoosePackagesAndServicesView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h *.2),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorManager.primary,
                statusBarIconBrightness: Brightness.light
            ),
            backgroundColor: ColorManager.primary,
            elevation: 0.0,
            iconTheme: IconThemeData(color: ColorManager.white),
            centerTitle: false,
            flexibleSpace: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h *.05,),
                  Text(
                    AppStrings.choosePackageServiceMessage.tr(),
                    style: getSemiBoldStyle(
                        color: ColorManager.white, fontSize: FontSize.s16.sp),
                  )
                ],
              ),
            ),
            bottom: TabBar(
              indicatorColor: ColorManager.white,
              labelColor: ColorManager.white,
              controller: _tabController,
              tabs: [
                Text(
                  AppStrings.packages.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s16.sp),
                ),
                Text(
                  AppStrings.services.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s16.sp),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.s420.h,
                    width: AppSize.s1000.w,
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        ChoosePackagesView(),
                        ChooseServicesView(),
                      ],
                    ),
                  ),
                  SizedBox(height: h *.02,),
                  BuildButton(text: AppStrings.next.tr(),onPressed: (){
                    if (_tabController?.index == 1) {
                      Navigator.of(context)
                          .pushNamed(Routes.scheduleRoute);
                    } else {
                      _tabController?.animateTo(1);
                    }
                  },),
                ],
              )),
        ));
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
}
