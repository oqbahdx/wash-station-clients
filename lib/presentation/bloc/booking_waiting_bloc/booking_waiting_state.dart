part of 'booking_waiting_cubit.dart';

@immutable
abstract class BookingWaitingState {}

class BookingWaitingInitial extends BookingWaitingState {}
class LoadingBookingRequestsState extends BookingWaitingState {}
class SuccessBookingRequestsState extends BookingWaitingState {}
class ErrorBookingRequestsState extends BookingWaitingState {
  final String error;
  ErrorBookingRequestsState(this.error);
}
