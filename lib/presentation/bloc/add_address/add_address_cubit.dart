import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressCubit() : super(AddAddressInitial());
  bool isHome = true;
  bool isOffice = false;
  bool isOther = false;
  changeItToHome(){
    isHome = true;
    isOffice = false;
    isOther = false;
    emit(AddAddressChangeItToHome());
  }
  changeItToOffice(){
    isHome = false;
    isOffice = true;
    isOther = false;
    emit(AddAddressChangeItToOffice());
  }
  changeItToOthers(){
    isHome = false;
    isOffice = false;
    isOther = true;
    emit(AddAddressChangeItToOthers());
  }

}
