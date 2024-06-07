part of 'booking_complete_cubit.dart';

@immutable
abstract class BookingCompleteState {}

class BookingCompleteInitial extends BookingCompleteState {}

class LoadingCompleteRequests extends BookingCompleteState {}

class SuccessCompleteRequests extends BookingCompleteState {}

class ErrorCompleteRequests extends BookingCompleteState {
  final String error;

  ErrorCompleteRequests(this.error);
}
