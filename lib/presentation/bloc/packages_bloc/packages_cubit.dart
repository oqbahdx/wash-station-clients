import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';

import '../../resources/Strings_manager.dart';
import '../services_bloc/services_cubit.dart';
import 'package:flutter/material.dart';

part 'packages_state.dart';

class ChoosePackagesCubit extends Cubit<ChoosePackagesState> {
  ChoosePackagesCubit() : super(PackagesInitial());
  bool isBasic = true;
  bool isDeluxe = false;
  bool isUltimate = false;
  int total = 18;
  String mainService = AppStrings.basicHandWash.tr();
  final GlobalKey _tireKey = GlobalKey();
  final GlobalKey _dashboardKey = GlobalKey();
  final GlobalKey _trunkKey = GlobalKey();
  final GlobalKey _rainKey = GlobalKey();
  final GlobalKey _windowsKey = GlobalKey();
  final GlobalKey _sealerKey = GlobalKey();
  List<Widget> servicesList = [];

  makeItBasic() {
    total = 18;
    mainService = AppStrings.basicHandWash.tr();
    isBasic = true;
    isDeluxe = false;
    isUltimate = false;
    emit(MakeItBasicState());
  }

  makeItDeluxe() {
    total = 30;
    mainService = AppStrings.deluxeWash.tr();
    isBasic = false;
    isDeluxe = true;
    isUltimate = false;
    emit(MakeItDeluxeState());
  }

  makeItUltimate() {
    total = 49;
    mainService = AppStrings.ultimateShine.tr();
    isBasic = false;
    isDeluxe = false;
    isUltimate = true;
    emit(MakeItUltimateState());
  }

  bool isTire = false;
  bool isDashboard = false;
  bool isTrunk = false;
  bool isRain = false;
  bool isWindows = false;
  bool isSealer = false;

  makeItTire() {
    isTire = !isTire;
    if (isTire) {
      total = total + 4;
      servicesList.add(Row(
        key: _tireKey,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.tireDressing.tr(),
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s16.sp),
          ),
          Text(
            '4 ${AppStrings.riyal.tr()}',
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s16.sp),
          )
        ],
      ));
    } else {
      total = total - 4;
      servicesList.removeWhere((element) => element.key == _tireKey);
    }
    emit(MakeItTireState());
  }

  makeItDashboard() {
    isDashboard = !isDashboard;
    if (isDashboard) {
      total = total + 2;
      servicesList.add(Row(
        key: _dashboardKey,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.dashboardClean.tr(),
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s16.sp),
          ),
          Text(
            '2 ${AppStrings.riyal.tr()}',
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s16.sp),
          )
        ],
      ));
    } else {
      total = total - 2;
      servicesList.removeWhere((element) => element.key == _dashboardKey);
    }
    emit(MakeItDashboardState());
  }

  makeItTrunk() {
    isTrunk = !isTrunk;
    if (isTrunk) {
      total = total + 3;
      servicesList.add(Row(
        key: _trunkKey,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.trunkVacuum.tr(),
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s16.sp),
          ),
          Text(
            '3 ${AppStrings.riyal.tr()}',
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s16.sp),
          )
        ],
      ));
    } else {
      total = total - 3;
      servicesList.removeWhere((element) => element.key == _trunkKey);
    }
    emit(MakeItTrunkState());
  }

  makeItRain() {
    isRain = !isRain;
    if (isRain) {
      total = total + 5;
      servicesList.add(Row(
        key: _rainKey,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.rainXComplete.tr(),
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s16.sp),
          ),
          Text(
            '5 ${AppStrings.riyal.tr()}',
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s16.sp),
          )
        ],
      ));
    } else {
      total = total - 5;
      servicesList.removeWhere((element) => element.key == _rainKey);
    }
    emit(MakeItRainState());
  }

  makeItWindows() {
    isWindows = !isWindows;

    if (isWindows) {
      total = total + 10;
      servicesList.add(Row(
        key: _windowsKey,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.windowsInOut.tr(),
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s16.sp),
          ),
          Text(
            '10 ${AppStrings.riyal.tr()}',
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s16.sp),
          )
        ],
      ));
    } else {
      total = total - 10;
      servicesList.removeWhere((element) => element.key == _windowsKey);
    }
    emit(MakeItWindowsState());
  }

  makeItSealer() {
    isSealer = !isSealer;
    if (isSealer) {
      total = total + 4;
      servicesList.add(Row(
        key: _sealerKey,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.sealerHandWax.tr(),
            style: getSemiBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s16.sp),
          ),
          Text(
            '4 ${AppStrings.riyal.tr()}',
            style: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s16.sp),
          )
        ],
      ));
    } else {
      total = total - 4;
      servicesList.removeWhere((element) => element.key == _sealerKey);
    }
    emit(MakeItSealerState());
  }
}
