part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class LoadingUpdateProfileState extends ProfileState {}
class SuccessUpdateProfileState extends ProfileState {}
class ErrorUpdateProfileState extends ProfileState {
  final String error;
  ErrorUpdateProfileState(this.error);
}

class PickImageState extends ProfileState {}
class DeleteImageState extends ProfileState {}
class UpdateLanguage extends ProfileState {}
class LogoutState extends ProfileState {}
