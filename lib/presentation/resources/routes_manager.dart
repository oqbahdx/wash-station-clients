import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:washing_track/presentation/add_address/view/add_address.dart';
import 'package:washing_track/presentation/browse_map/view/browse_map.dart';
import 'package:washing_track/presentation/car_wash_details/view/car_wash_details.dart';
import 'package:washing_track/presentation/chat/view/chat_list.dart';
import 'package:washing_track/presentation/choose_location/view/choose_location.dart';
import 'package:washing_track/presentation/choose_packages_services/view/choose_packages_services.dart';
import 'package:washing_track/presentation/choose_services/view/choose_services.dart';
import 'package:washing_track/presentation/delivery_address/view/delivery_address.dart';
import 'package:washing_track/presentation/filter/view/filter.dart';
import 'package:washing_track/presentation/find_car_wash/view/find_car_wash.dart';
import 'package:washing_track/presentation/forgot_password/view/forgot_password.dart';
import 'package:washing_track/presentation/get_location/view/get_location.dart';
import 'package:washing_track/presentation/home/view/home.dart';
import 'package:washing_track/presentation/login/view/login.dart';
import 'package:washing_track/presentation/notifications/view/notifications.dart';
import 'package:washing_track/presentation/otp/view/otp.dart';
import 'package:washing_track/presentation/pickup_address/view/pickup_address.dart';
import 'package:washing_track/presentation/profile/view/profile.dart';
import 'package:washing_track/presentation/rating/view/rating.dart';
import 'package:washing_track/presentation/register/view/register.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';
import 'package:washing_track/presentation/review_booking/view/review_booking.dart';
import 'package:washing_track/presentation/schedule/view/schedule.dart';
import 'package:washing_track/presentation/search/view/search.dart';
import 'package:washing_track/presentation/select_languages/view/select_languages.dart';
import 'package:washing_track/presentation/select_payment_way/select_payment_way.dart';
import 'package:washing_track/presentation/services_history/view/services_history.dart';
import 'package:washing_track/presentation/settings/view/settings.dart';
import 'package:washing_track/presentation/success/view/success.dart';
import 'package:washing_track/presentation/tracking_map/tracking_map.dart';
import '../booking_details/view/booking_details.dart';
import '../chat/view/chat.dart';
import '../choose_packages/view/choose_packages.dart';
import '../on_boarding/view/on_boarding.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String servicesHistoryRoute = "/servicesHistory";
  static const String notificationsRoute = "/notifications";
  static const String otpRoute = "/otp";
  static const String profileRoute = "/profile";
  static const String homeRoute = "/home";
  static const String onBoardingRoute = "/onBoarding";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String getLocationRoute = "/getLocation";
  static const String selectLanguagesRoute = "/selectLanguages";
  static const String findCarWashRoute = "/findCarWash";
  static const String browseWashCarMapViewRoute = "/browseWashCarMapView";
  static const String searchRoute = "/search";
  static const String filterRoute = "/filter";
  static const String bookingDetailsRoute = "/bookingDetails";
  static const String chooseLocationRoute = "/chooseLocation";
  static const String carWashDetailsRoute = "/carWashDetails";
  static const String addAddressRoute = "/addAddress";
  static const String paymentRoute = "/payment";
  static const String settingsRoute = "/settings";
  static const String choosePackagesAndServicesRoute =
      "/choosePackagesAndService";
  static const String choosePackagesRoute = "/choosePackages";
  static const String chooseServicesRoute = "/chooseServices";
  static const String scheduleRoute = "/schedule";
  static const String pickupAddressRoute = "/pickupAddress";
  static const String deliveryAddressRoute = "/delivery";
  static const String successRoute = "/success";
  static const String ratingRoute = "/rating";
  static const String reviewBookingRoute = "/reviewBooking";
  static const String chatRoute = "/chat";
  static const String chatListRoute = "/chatList";
  static const String selectPaymentWayRoute = "/selectPaymentWay";
  static const String trackingMapRoute = "/trackingMap";
}

class RouteGenerator {
  static PageRoute getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const LoginView());
        } else {
          return CupertinoPageRoute(builder: (_) => const LoginView());
        }
      case Routes.registerRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const RegisterView());
        } else {
          return CupertinoPageRoute(builder: (_) => const RegisterView());
        }
      case Routes.servicesHistoryRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ServicesHistoryView());
        } else {
          return CupertinoPageRoute(
              builder: (_) => const ServicesHistoryView());
        }
      case Routes.notificationsRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const NotificationsView());
        } else {
          return CupertinoPageRoute(builder: (_) => const NotificationsView());
        }
      case Routes.otpRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const OTPView());
        } else {
          return CupertinoPageRoute(builder: (_) => const OTPView());
        }
      case Routes.profileRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ProfileView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ProfileView());
        }
      case Routes.homeRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const HomeView());
        } else {
          return CupertinoPageRoute(builder: (_) => const HomeView());
        }
      case Routes.onBoardingRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const OnBoardingView());
        } else {
          return CupertinoPageRoute(builder: (_) => const OnBoardingView());
        }
      case Routes.forgotPasswordRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ForgotPasswordView());
        }
      case Routes.getLocationRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const GetLocationView());
        } else {
          return CupertinoPageRoute(builder: (_) => const GetLocationView());
        }
      case Routes.selectLanguagesRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const SelectLanguagesView());
        } else {
          return CupertinoPageRoute(
              builder: (_) => const SelectLanguagesView());
        }
      case Routes.findCarWashRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const FindCarWashView());
        } else {
          return CupertinoPageRoute(builder: (_) => const FindCarWashView());
        }
      case Routes.browseWashCarMapViewRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(
              builder: (_) => const BrowseWashCarMapView());
        } else {
          return CupertinoPageRoute(
              builder: (_) => const BrowseWashCarMapView());
        }
      case Routes.searchRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const SearchView());
        } else {
          return CupertinoPageRoute(builder: (_) => const SearchView());
        }
      case Routes.filterRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const FilterView());
        } else {
          return CupertinoPageRoute(builder: (_) => const FilterView());
        }
      case Routes.bookingDetailsRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const BookingDetailsView());
        } else {
          return CupertinoPageRoute(builder: (_) => const BookingDetailsView());
        }
      case Routes.chooseLocationRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ChooseLocationView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ChooseLocationView());
        }
      case Routes.carWashDetailsRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const CarWashDetails());
        } else {
          return CupertinoPageRoute(builder: (_) => const CarWashDetails());
        }
      case Routes.addAddressRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const AddAddressView());
        } else {
          return CupertinoPageRoute(builder: (_) => const AddAddressView());
        }
      case Routes.settingsRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const SettingsView());
        } else {
          return CupertinoPageRoute(builder: (_) => const SettingsView());
        }
      case Routes.choosePackagesAndServicesRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(
              builder: (_) => const ChoosePackagesAndServicesView());
        } else {
          return CupertinoPageRoute(
              builder: (_) => const ChoosePackagesAndServicesView());
        }
      case Routes.choosePackagesRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ChoosePackagesView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ChoosePackagesView());
        }
      case Routes.chooseServicesRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ChooseServicesView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ChooseServicesView());
        }
      case Routes.scheduleRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ScheduleView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ScheduleView());
        }
      case Routes.pickupAddressRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const PickupAddressView());
        } else {
          return CupertinoPageRoute(builder: (_) => const PickupAddressView());
        }
      case Routes.deliveryAddressRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const DeliveryAddressView());
        } else {
          return CupertinoPageRoute(
              builder: (_) => const DeliveryAddressView());
        }
      case Routes.successRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const SuccessView());
        } else {
          return CupertinoPageRoute(builder: (_) => const SuccessView());
        }
      case Routes.ratingRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const RatingView());
        } else {
          return CupertinoPageRoute(builder: (_) => const RatingView());
        }
      case Routes.reviewBookingRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ReviewBookingView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ReviewBookingView());
        }
      case Routes.chatRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ChatView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ChatView());
        }
      case Routes.chatListRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const ChatListView());
        } else {
          return CupertinoPageRoute(builder: (_) => const ChatListView());
        }
      case Routes.selectPaymentWayRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const SelectPaymentWay());
        } else {
          return CupertinoPageRoute(builder: (_) => const SelectPaymentWay());
        }
      case Routes.trackingMapRoute:
        if (Platform.isAndroid) {
          return MaterialPageRoute(builder: (_) => const TrackingMapView());
        } else {
          return CupertinoPageRoute(builder: (_) => const TrackingMapView());
        }
      default:
        return pageNotFound();
    }
  }

  static PageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.pageNotFound),
              ),
              body: const Center(child: Text(AppStrings.pageNotFound)),
            ));
  }
}
