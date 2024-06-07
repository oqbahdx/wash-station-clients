import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:washing_track/app/app_prefs.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/app/di.dart';
import 'package:washing_track/presentation/bloc/booking_active_bloc/booking_active_cubit.dart';
import 'package:washing_track/presentation/booking/view/booking.dart';
import 'package:washing_track/presentation/chat/view/chat_list.dart';
import 'package:washing_track/presentation/find_car_wash/view/find_car_wash.dart';
import 'package:washing_track/presentation/notifications/view/notifications.dart';
import 'package:washing_track/presentation/profile/view/profile.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/resources/assets_manager.dart';
import 'package:washing_track/presentation/resources/color_manager.dart';
import 'package:washing_track/presentation/resources/value_manager.dart';
import 'package:washing_track/presentation/services_history/view/services_history.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../bloc/services_history/services_history_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

AppPreferences _appPreferences = instance<AppPreferences>();
int _currentIndex = 0;
final List<Widget> _pages = [
  const FindCarWashView(),
  const BookingView(),
  // const ServicesHistoryView(),
  const ChatListView(),
  const NotificationsView(),
  const ProfileView()
];

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    _appPreferences.getToken(key: "token").then((value) {
      Constants.token = value ?? "";
    });
    _appPreferences.getUserId(key: 'userId').then((value) {
       Constants.userId = value ?? "";
    });
    if (kDebugMode) {
      print("token for home page : ${Constants.token}");
    }
    if (kDebugMode) {
      print("first name for home page : ${Constants.firstName}");
      print("last name for home page : ${Constants.lastName}");
    }
    if (kDebugMode) {
      print("phone number home page : ${Constants.phoneNumber}");
    }
    context.read<ServicesHistoryCubit>().getServicesHistory();
    context.read<BookingActiveCubit>().getActiveRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.primary,
              statusBarIconBrightness: Brightness.light),
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
          if (kDebugMode) {
            print(value.toString());
          }
        },
        fixedColor: ColorManager.primary,
        unselectedItemColor: ColorManager.grey,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                IconsAssets.searchIc,
                color: ColorManager.primary,
              ),
              label: AppStrings.browse.tr()),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                IconsAssets.bookingIc,
                color: ColorManager.primary,
              ),
              label: AppStrings.booking.tr()),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_outlined,size: AppSize.s30,color: ColorManager.primary,),
              label: AppStrings.chats.tr()),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                IconsAssets.notificationsIc,
                color: ColorManager.primary,
              ),
              label: AppStrings.notification.tr()),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                IconsAssets.accountIc,
                color: ColorManager.primary,
              ),
              label: AppStrings.account.tr()),
        ],
      ),
    );
  }
}
