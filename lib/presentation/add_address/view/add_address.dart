import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing_track/presentation/bloc/add_address/add_address_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/common_widgets/textField.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';

import '../../common_widgets/add_address_items.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

TextEditingController? _streetController;

TextEditingController? _cityController;

TextEditingController? _stateController;

TextEditingController? _countryController;

TextEditingController? _zipCodeController;

class _AddAddressViewState extends State<AddAddressView> {
  @override
  void initState() {
    super.initState();
    _streetController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _countryController = TextEditingController();
    _zipCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light),
        title: Text(
          AppStrings.addAddress.tr(),
          style:
              getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
        ),
        centerTitle: false,
        backgroundColor: ColorManager.white,
        elevation: 0.0,
      ),
      backgroundColor: ColorManager.white,
      body: BlocConsumer<AddAddressCubit, AddAddressState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    color: ColorManager.white,
                    elevation: 5.0,
                    child: Container(
                      alignment: Alignment.center,
                      height: h * .825,
                      width: w * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorManager.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p8),
                        child: ListView(
                          children: [
                            Text(
                              AppStrings.chooseAddressType.tr(),
                              style: getMediumStyle(
                                  color: ColorManager.grey,
                                  fontSize: FontSize.s17),
                            ),
                            const Divider(),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BuildAddAddressType(
                                  w: w,
                                  text: AppStrings.house.tr(),
                                  isActive:
                                      context.read<AddAddressCubit>().isHome,
                                  onTap: () {
                                    context
                                        .read<AddAddressCubit>()
                                        .changeItToHome();
                                  },
                                  w1: w * .048,
                                ),
                                BuildAddAddressType(
                                  w: w,
                                  text: AppStrings.office.tr(),
                                  isActive:
                                      context.read<AddAddressCubit>().isOffice,
                                  onTap: () {
                                    context
                                        .read<AddAddressCubit>()
                                        .changeItToOffice();
                                  },
                                  w1: w * .048,
                                ),
                                BuildAddAddressType(
                                  w: w,
                                  text: AppStrings.other.tr(),
                                  isActive:
                                      context.read<AddAddressCubit>().isOther,
                                  onTap: () {
                                    context
                                        .read<AddAddressCubit>()
                                        .changeItToOthers();
                                  },
                                  w1: w * .048,
                                )
                              ],
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            const Divider(),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            BuildTextField(
                              label: Text(AppStrings.street.tr()),
                              controller: _streetController!,
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            BuildTextField(
                                label: Text(AppStrings.city.tr()),
                                controller: _cityController!),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            BuildTextField(
                                label: Text(AppStrings.state.tr()),
                                controller: _stateController!),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            BuildTextField(
                                label: Text(AppStrings.country.tr()),
                                controller: _countryController!),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            BuildTextField(
                                label: Text(AppStrings.zipCode.tr()),
                                controller: _zipCodeController!),
                            SizedBox(
                              height: h * .05,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: BuildButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                text: AppStrings.save.tr(),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _streetController!.dispose();
    _cityController!.dispose();
    _stateController!.dispose();
    _countryController!.dispose();
    _zipCodeController!.dispose();
    super.dispose();
  }
}
