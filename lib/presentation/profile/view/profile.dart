import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/bloc/profile_bloc/profile_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/common_widgets/textField.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
import '../../common_widgets/profile_items.dart';
import '../../resources/routes_manager.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _phoneNumberController;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fToast.init(context);
    _firstNameController = TextEditingController(text: Constants.firstName);
    _lastNameController = TextEditingController(text: Constants.lastName);
    _phoneNumberController = TextEditingController(
        text: Constants.phoneNumber.replaceFirst('+971', '0'));
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Spacer(),
                BuildDrawer(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.servicesHistoryRoute);
                  },
                  h: h,
                  text: AppStrings.servicesHistory.tr(),
                  icon: Icons.car_crash,
                ),
                BuildDrawer(
                  onTap: () {
                    isRTL()
                        ? cubit.changeLangToEnglish(context)
                        : cubit.changeLangToArabic(context);
                    Phoenix.rebirth(context);
                  },
                  h: h,
                  text: isRTL()
                      ? AppStrings.changeLanguageEnglish.tr()
                      : AppStrings.changeLanguageArabic.tr(),
                  icon: Icons.translate,
                ),
                BuildDrawer(
                  onTap: () {
                    cubit.showLogoutDialog(context);
                  },
                  h: h,
                  text: AppStrings.logout.tr(),
                  icon: Icons.login,
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: ColorManager.primary,
            elevation: 0,
            iconTheme: IconThemeData(color: ColorManager.white),
          ),
          backgroundColor: ColorManager.primary,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: state is LoadingUpdateProfileState
                    ? const ProfileLoading()
                    : Column(
                        children: [
                          SizedBox(
                            height: h * .01,
                          ),
                          Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              height: AppSize.s125.h,
                              width: AppSize.s140.w,
                              decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Constants.profilePicture == "null"
                                  ? cubit.image == null
                                      ? IconButton(
                                          onPressed: () {
                                            cubit.pickImage();
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            size: AppSize.s50,
                                          ))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.file(
                                            cubit.image!,
                                            fit: BoxFit.cover,
                                          ))
                                  : ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "${Constants.imagePathUrl}${Constants.profilePicture}"),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: h * .05,
                          ),
                          BuildTextField(
                              label: Text(_firstNameController!.text),
                              controller: _firstNameController!),
                          SizedBox(
                            height: h * .03,
                          ),
                          BuildTextField(
                              label: Text(_lastNameController!.text),
                              controller: _lastNameController!),
                          SizedBox(
                            height: h * .03,
                          ),
                          BuildTextField(
                              label: Text(_phoneNumberController!.text),
                              controller: _phoneNumberController!),
                          SizedBox(
                            height: h * .07,
                          ),
                          state is LoadingUpdateProfileState
                              ? const LoadingButton()
                              : BuildButton(
                                  text: AppStrings.update.tr(),
                                  onPressed: () {
                                    if (cubit.image != null) {
                                      cubit.updateProfileWithImage(
                                          firstName:
                                              _firstNameController!.text.trim(),
                                          lastName:
                                              _lastNameController!.text.trim(),
                                          phoneNumber: _phoneNumberController!
                                              .text
                                              .trim());
                                    } else {
                                      cubit.updateProfile(
                                          firstName:
                                              _firstNameController!.text.trim(),
                                          lastName:
                                              _lastNameController!.text.trim(),
                                          phoneNumber: _phoneNumberController!
                                              .text
                                              .trim());
                                    }
                                  },
                                ),
                        ],
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
    _firstNameController!.dispose();
    _lastNameController!.dispose();
    _phoneNumberController!.dispose();
    super.dispose();
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
