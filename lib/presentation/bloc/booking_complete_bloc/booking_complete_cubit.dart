import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/data/network/dio_helper.dart';

part 'booking_complete_state.dart';

class BookingCompleteCubit extends Cubit<BookingCompleteState> {
  BookingCompleteCubit() : super(BookingCompleteInitial());


  Future<void> getCompletedRequests()async{
    emit(LoadingCompleteRequests());
    DioHelper.init();
    DioHelper.getData(endPoint: Constants.completeRequestsEndPoint).then((value){

      emit(SuccessCompleteRequests());
    }).catchError((error){

      emit(ErrorCompleteRequests(error.toString()));
    });
  }
}
