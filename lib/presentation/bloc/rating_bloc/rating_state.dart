part of 'rating_cubit.dart';

@immutable
abstract class RatingState {}

class RatingInitial extends RatingState {}
class LoadingRateState extends RatingState{}
class SuccessRateState extends RatingState{}
class ErrorRateState extends RatingState{
  final String error;

  ErrorRateState(this.error);
}