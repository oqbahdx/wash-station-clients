part of 'review_booking_cubit.dart';

@immutable
abstract class ReviewBookingState {}

class ReviewBookingInitial extends ReviewBookingState {}
class LoadingRequestServiceState extends ReviewBookingState {}
class SuccessRequestServiceState extends ReviewBookingState {}
class ErrorRequestServiceState extends ReviewBookingState {
  final String error;
  ErrorRequestServiceState(this.error);
}

