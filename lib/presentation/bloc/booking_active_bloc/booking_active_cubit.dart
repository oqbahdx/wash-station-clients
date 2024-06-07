import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/data/network/dio_helper.dart';

import '../../../domain/pending_requests_model/pending_requests_model.dart';


part 'booking_active_state.dart';

class BookingActiveCubit extends Cubit<BookingActiveState> {
  BookingActiveCubit() : super(BookingInitial());

  PendingRequestsModel? pendingRequestsModel;
  // todo : change it to active requests model
  getActiveRequests()async{
    emit(LoadingActiveRequests());
    DioHelper.init();
    DioHelper.getData(endPoint: Constants.pendingRequestsEndPoint).then((value){
      pendingRequestsModel = PendingRequestsModel.fromJson(value!.data);
      debugPrint("SSSSSSSSSSSSSSSSSSSSSSSSS");
      emit(SuccessActiveRequests());
    }).catchError((error){
      debugPrint("EEEEEEEEEEEEEEEEEEEEEEEEe");
      emit(ErrorActiveRequests(error.toString()));
    });
  }
}
// todo : handle this ui for this logic