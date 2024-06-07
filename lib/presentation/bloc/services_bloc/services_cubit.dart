import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());
  // bool isTire = false;
  // bool isDashboard = false;
  // bool isTrunk = false;
  // bool isRain = false;
  // bool isWindows = false;
  // bool isSealer = false;
  //
  // makeItTire() {
  //   isTire = !isTire;
  //   emit(MakeItTireState());
  // }
  //
  // makeItDashboard() {
  //   isDashboard = !isDashboard;
  //   emit(MakeItDashboardState());
  // }
  //
  // makeItTrunk() {
  //   isTrunk = !isTrunk;
  //   emit(MakeItTrunkState());
  // }
  //
  // makeItRain() {
  //   isRain = !isRain;
  //   emit(MakeItRainState());
  // }
  //
  // makeItWindows() {
  //   isWindows = !isWindows;
  //   emit(MakeItWindowsState());
  // }
  //
  // makeItSealer() {
  //   isSealer = !isSealer;
  //   emit(MakeItSealerState());
  // }
}
