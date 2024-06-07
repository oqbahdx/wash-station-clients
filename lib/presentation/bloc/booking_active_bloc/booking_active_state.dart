part of 'booking_active_cubit.dart';

@immutable
abstract class BookingActiveState {}

class BookingInitial extends BookingActiveState {}
class LoadingActiveRequests extends BookingActiveState {}
class SuccessActiveRequests extends BookingActiveState {}
class ErrorActiveRequests extends BookingActiveState {
  final String  error;
  ErrorActiveRequests(this.error);
}
