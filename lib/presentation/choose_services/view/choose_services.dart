import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing_track/presentation/bloc/packages_bloc/packages_cubit.dart';
import 'package:washing_track/presentation/bloc/services_bloc/services_cubit.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';

import '../../common_widgets/choose_services_items.dart';

class ChooseServicesView extends StatefulWidget {
  const ChooseServicesView({super.key});

  @override
  State<ChooseServicesView> createState() => _ChooseServicesViewState();
}

class _ChooseServicesViewState extends State<ChooseServicesView> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChoosePackagesCubit>();
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocBuilder<ChoosePackagesCubit, ChoosePackagesState>(
        builder: (context, state) {
          return Center(
            child: Column(

              children: [
                SizedBox(height: h *.02,),
                BuildChooseServicesItems(
                  onTap: () {
                   cubit.makeItTire();
                  },
                  h: h,
                  w: w,
                  feature: AppStrings.tireDressing.tr(),
                  price: '4 ${AppStrings.riyal.tr()}',
                  isSelected: cubit.isTire,
                ),

                BuildChooseServicesItems(
                  onTap: () {
                    cubit.makeItDashboard();
                  },
                  h: h,
                  w: w,
                  feature: AppStrings.dashboardClean.tr(),
                  price: '2 ${AppStrings.riyal.tr()}',
                  isSelected: cubit.isDashboard,
                ),

                BuildChooseServicesItems(
                  onTap: () {
                    cubit.makeItTrunk();
                  },
                  h: h,
                  w: w,
                  feature: AppStrings.trunkVacuum.tr(),
                  price: '3 ${AppStrings.riyal.tr()}',
                  isSelected: cubit.isTrunk,
                ),
                BuildChooseServicesItems(
                  onTap: () {
                    cubit.makeItRain();

                  },
                  h: h,
                  w: w,
                  feature: AppStrings.rainXComplete.tr(),
                  price: '5 ${AppStrings.riyal.tr()}',
                  isSelected: cubit.isRain,
                ),

                BuildChooseServicesItems(
                  onTap: () {
                    cubit.makeItWindows();

                  },
                  h: h,
                  w: w,
                  feature: AppStrings.windowsInOut.tr(),
                  price: '10 ${AppStrings.riyal.tr()}',
                  isSelected: cubit.isWindows,
                ),

                BuildChooseServicesItems(
                  onTap: () {
                    cubit.makeItSealer();

                  },
                  h: h,
                  w: w,
                  feature: AppStrings.sealerHandWax.tr(),
                  price: '4 ${AppStrings.riyal.tr()}',
                  isSelected: cubit.isSealer,
                ),
                // SizedBox(
                //   height:AppSize.s100.h,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
