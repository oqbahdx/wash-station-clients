import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:washing_track/app/languages_manager.dart';
import 'package:washing_track/presentation/bloc/schedule_bloc/schedule_cubit.dart';
import 'package:washing_track/presentation/common_widgets/button.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/fonts_manager.dart';
import 'package:washing_track/presentation/resources/routes_manager.dart';
import 'package:washing_track/presentation/resources/style_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
import '../../common_widgets/schedule_items.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ScheduleCubit>();
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: ColorManager.primary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h * .05),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorManager.primary,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: ColorManager.primary,
            iconTheme: IconThemeData(color: ColorManager.white),
            elevation: 0.0,
          ),
        ),
        body: BlocBuilder<ScheduleCubit, ScheduleState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      child: TableCalendar(
                        calendarStyle: CalendarStyle(
                            rangeHighlightColor: ColorManager.white,
                            defaultTextStyle:
                                getSemiBoldStyle(color: ColorManager.primary),
                            selectedDecoration: BoxDecoration(
                                color: ColorManager.primary,
                                shape: BoxShape.circle),
                            selectedTextStyle:
                                TextStyle(color: ColorManager.white)),
                        availableGestures: AvailableGestures.all,
                        locale: isRTL() ? 'ar' : 'en',
                        focusedDay: cubit.selectedDate,
                        firstDay: DateTime(1900),
                        lastDay: DateTime(2100),
                        selectedDayPredicate: (day) {
                          return isSameDay(cubit.newSelectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          cubit.onDaySelected(selectedDay, focusedDay);
                          if (kDebugMode) {
                            print("${cubit.newFocusedDay}");
                          }
                          if (kDebugMode) {
                            print("${cubit.newSelectedDay}");
                          }
                        },
                      ),
                    ),
                    Align(
                        alignment: isRTL()
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          AppStrings.availableTime.tr(),
                          style: getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s20.sp),
                        )),
                    SizedBox(
                      height: h * .02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '6 - 8 ${AppStrings.am.tr()}',
                          isSelected: cubit.is6to8am,
                          onTap: () {
                            cubit.from6to8am();
                          },
                        ),
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '8 - 10 ${AppStrings.am.tr()}',
                          isSelected: cubit.is8to10am,
                          onTap: () {
                            cubit.from8to10am();
                          },
                        ),
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '10 - 12 ${AppStrings.pm.tr()}',
                          isSelected: cubit.is10to12pm,
                          onTap: () {
                            cubit.from10to12pm();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '12 - 2 ${AppStrings.pm.tr()}',
                          isSelected: cubit.is12to2pm,
                          onTap: () {
                            cubit.from12to2pm();
                          },
                        ),
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '2 - 4 ${AppStrings.pm.tr()}',
                          isSelected: cubit.is2to4pm,
                          onTap: () {
                            cubit.from2to4pm();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * .01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '4 - 6 ${AppStrings.pm.tr()}',
                          isSelected: cubit.is4to6pm,
                          onTap: () {
                            cubit.from4to6pm();
                          },
                        ),
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '6 - 8 ${AppStrings.pm.tr()}',
                          isSelected: cubit.is6to8pm,
                          onTap: () {
                            cubit.from6to8pm();
                          },
                        ),
                        BuildScheduleItems(
                          h: h,
                          w: w,
                          time: '8 - 10 ${AppStrings.pm.tr()}',
                          isSelected: cubit.is8to10pm,
                          onTap: () {
                            cubit.from8to10pm();
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * .055,
                    ),
                    BuildButton(
                      text: AppStrings.next.tr(),
                      onPressed: () {
                        if (context.read<ScheduleCubit>().selectedTime ==
                            null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: ColorManager.white,
                              content: Text(
                                AppStrings.selectTimeMessage.tr(),
                                style: getSemiBoldStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s18.sp),
                              )));
                        } else {
                          Navigator.of(context)
                              .pushNamed(Routes.reviewBookingRoute);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  bool isRTL() {
    return context.locale == ARABIC_LOCALE;
  }
}
