part of 'add_address_cubit.dart';

@immutable
abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}
class AddAddressChangeItToHome extends AddAddressState {}
class AddAddressChangeItToOffice extends AddAddressState {}
class AddAddressChangeItToOthers extends AddAddressState {}
