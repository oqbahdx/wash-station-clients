part of 'find_car_wash_cubit.dart';

@immutable
abstract class FindCarWashState {}

class FindCarWashInitial extends FindCarWashState {}
class GetMarkersSuccessState extends FindCarWashState {}
class OpenScreenState extends FindCarWashState {}
class CloseScreenState extends FindCarWashState {}
