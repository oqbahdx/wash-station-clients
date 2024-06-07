import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/data/network/dio_helper.dart';
import 'package:washing_track/domain/service_model/services_model.dart';
import 'package:flutter/material.dart';

import '../../resources/Strings_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/fonts_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';
part 'services_history_state.dart';

class ServicesHistoryCubit extends Cubit<ServicesHistoryState> {
  ServicesHistoryCubit() : super(ServicesHistoryInitial());
  FToast fToast = FToast();

  showCustomToast(
      {required String message,
        required Color color,
        Color messageColor = Colors.black}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        color: color,
      ),
      child: Text(
        message,
        style: getBoldStyle(color: messageColor, fontSize: FontSize.s14.sp),
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  showNoInternetMessage() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s10),
        color: ColorManager.textFormDarkGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            AppStrings.noInternetConnection.tr(),
            style: getBoldStyle(
                color: ColorManager.black, fontSize: AppSize.s14.sp),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 4),
    );
  }

  ServicesHistoryModel? servicesHistoryModel;
  getServicesHistory()async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      DioHelper.init();
      emit(LoadingServicesHistoryState());
      DioHelper.getData(endPoint: Constants.servicesHistoryEndPoint).then((
          value) {
        servicesHistoryModel = ServicesHistoryModel.fromJson(value!.data);
        emit(SuccessServicesHistoryState());
        if (kDebugMode) {
          print(servicesHistoryModel!.message);
          print("SSSSSSSSSSSSSSSSSSSSSSSSSSSS");
        }

        if (kDebugMode) {
          print(servicesHistoryModel!.serviceHistories![0].paymentAmount);
        }
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
          print("EEEEEEEEEEEEEEEEEEEEEEEEE");
        }
        emit(ErrorServicesHistoryState(error.toString()));
      });
    } else {
      showNoInternetMessage();
    }
  }
}
