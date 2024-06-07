import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing_track/presentation/bloc/packages_bloc/packages_cubit.dart';
import 'package:washing_track/presentation/common_widgets/choose_packages_items.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';


class ChoosePackagesView extends StatefulWidget {
  const ChoosePackagesView({super.key});

  @override
  State<ChoosePackagesView> createState() => _ChoosePackagesViewState();
}

class _ChoosePackagesViewState extends State<ChoosePackagesView> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    var cubit = context.read<ChoosePackagesCubit>();
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocBuilder<ChoosePackagesCubit, ChoosePackagesState>(
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BuildChoosePackagesItems(
                    onTap: () {
                      cubit.makeItBasic();
                    },
                    h: h,
                    w: w,
                    title: AppStrings.basicHandWash.tr(),
                    price: "18 ${AppStrings.riyal.tr()}",
                    time: "30 ${AppStrings.min.tr()}",
                    feature1: AppStrings.exteriorWash.tr(),
                    feature2: AppStrings.towelDry.tr(),
                    isSelected: cubit.isBasic),
                BuildChoosePackagesItems(
                    onTap: () {
                      cubit.makeItDeluxe();
                    },
                    h: h,
                    w: w,
                    title: AppStrings.deluxeWash.tr(),
                    price: "30 ${AppStrings.riyal.tr()}",
                    time: "45 ${AppStrings.min.tr()}",
                    feature1: AppStrings.wheelShine.tr(),
                    feature2: AppStrings.tireDressing.tr(),
                    isSelected: cubit.isDeluxe),
                BuildChoosePackagesItems(
                    onTap: () {
                      cubit.makeItUltimate();
                    },
                    h: h,
                    w: w,
                    title: AppStrings.ultimateShine.tr(),
                    price: "49 ${AppStrings.riyal.tr()}",
                    time: "80 ${AppStrings.min.tr()}",
                    feature1: AppStrings.towelDry.tr(),
                    feature2: AppStrings.windowsInOut.tr(),
                    isSelected: cubit.isUltimate),
              ],
            ),
          );
        },
      ),
    );
  }
}
