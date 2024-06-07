part of 'services_history_cubit.dart';

@immutable
abstract class ServicesHistoryState {}

class ServicesHistoryInitial extends ServicesHistoryState {}
class LoadingServicesHistoryState extends ServicesHistoryState {}
class SuccessServicesHistoryState extends ServicesHistoryState {}
class ErrorServicesHistoryState extends ServicesHistoryState {
  final String error;
  ErrorServicesHistoryState(this.error);
}
