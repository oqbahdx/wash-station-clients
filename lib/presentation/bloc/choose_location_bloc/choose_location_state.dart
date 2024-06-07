part of 'choose_location_cubit.dart';

@immutable
abstract class ChooseLocationState {}

class ChooseLocationInitial extends ChooseLocationState {}
class GetCurrentPositionState extends ChooseLocationState {}
class GetAddressFromCoordinatesState extends ChooseLocationState {}
class TakeMeToMyLocationState extends ChooseLocationState {}
class OnTapState extends ChooseLocationState {}
class OnLongPressState extends ChooseLocationState {}