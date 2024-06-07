import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/data/network/dio_helper.dart';
part 'review_booking_state.dart';

class ReviewBookingCubit extends Cubit<ReviewBookingState> {
  ReviewBookingCubit() : super(ReviewBookingInitial());

  serviceRequest({String? workerId,required String serviceType,required String preferredTime,
  required String lat ,required String long
  })async{
    emit(LoadingRequestServiceState());
    DioHelper.postData(endPoint: Constants.serviceRequestEndPoint,
        data: {
       // todo : get worker id automatic
         "worker_id":"",
          "location_long":long,
          "location_lat":lat,
         "service_type":serviceType,
         "preferred_time":preferredTime,
         "status":"pending",
        }).then((value){

          emit(SuccessRequestServiceState());
    }).catchError((error){

      emit(ErrorRequestServiceState(error.toString()));
    });
  }

}
