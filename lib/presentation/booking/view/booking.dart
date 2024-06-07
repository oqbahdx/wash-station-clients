import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/presentation/booking_active/view/booking_active.dart';
import 'package:washing_track/presentation/booking_complete/view/booking_complete.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';

import '../../booking_waiting/booking_waiting.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
        appBar: AppBar(
          leading: Container(),
          actions: [],
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.primary,
              statusBarIconBrightness: Brightness.light
          ),
          backgroundColor: ColorManager.primary,
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            AppStrings.booking.tr(),
            style:
                getBoldStyle(color: ColorManager.white, fontSize: FontSize.s30.sp),
          ),
          bottom: TabBar(
            indicatorColor: ColorManager.white,
            labelColor: ColorManager.white,
            controller: _tabController,
            tabs:  [
              Text(AppStrings.waiting.tr(),style: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s17.sp),),
              Text(AppStrings.active.tr(),style: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s17.sp),),
              Text(AppStrings.complete.tr(),style: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s17.sp),),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                controller: _tabController,
                children: const [
                  BookingWaitingView(),
                  BookingActiveView(),
                  BookingCompleteView()
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
