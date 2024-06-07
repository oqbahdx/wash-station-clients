import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
part 'get_location_state.dart';

class GetLocationCubit extends Cubit<GetLocationState> {
  GetLocationCubit() : super(GetLocationInitial());
  bool isGranted = false;
  isLocationGranted()async{
    return await Permission.location.isGranted;
  }
  Future<PermissionStatus> requestPermission()async{
    return await Permission.location.request();
  }
}