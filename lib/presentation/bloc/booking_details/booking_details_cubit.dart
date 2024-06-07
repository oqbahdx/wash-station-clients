import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_details_state.dart';

class BookingDetailsCubit extends Cubit<BookingDetailsState> {
  BookingDetailsCubit() : super(BookingDetailsInitial());
}
