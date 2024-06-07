part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class OtpSuccessState extends OtpState {}
class OtpLoadingState extends OtpState {}
class OtpErrorState extends OtpState {
  final String error;
  OtpErrorState(this.error);
}
class UpdateTimer extends OtpState{}