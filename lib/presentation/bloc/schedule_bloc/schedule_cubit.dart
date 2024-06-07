import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:washing_track/app/constants.dart';
import 'package:washing_track/presentation/resources/Strings_manager.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleInitial());
  DateTime selectedDate = DateTime.now();
  DateTime newSelectedDay = DateTime.now();
  DateTime newFocusedDay = DateTime.now();
  String? selectedTime;
  bool is6to8am = false;
  bool is8to10am = false;
  bool is10to12pm = false;
  bool is12to2pm = false;
  bool is2to4pm = false;
  bool is4to6pm = false;
  bool is6to8pm = false;
  bool is8to10pm = false;

  from6to8am() {
    selectedTime = "6 - 8 ${AppStrings.am.tr()}";
    is6to8am = true;
    is8to10am = false;
    is10to12pm = false;
    is12to2pm = false;
    is2to4pm = false;
    is4to6pm = false;
    is6to8pm = false;
    is8to10pm = false;
    emit(From6to8amState());
  }

  from8to10am() {
    selectedTime = "8 - 10 ${AppStrings.am.tr()}";
    is6to8am = false;
    is8to10am = true;
    is10to12pm = false;
    is12to2pm = false;
    is2to4pm = false;
    is4to6pm = false;
    is6to8pm = false;
    is8to10pm = false;
    emit(From8to10amState());
  }

  from10to12pm() {
    selectedTime = "10 - 12 ${AppStrings.pm.tr()}";
    is6to8am = false;
    is8to10am = false;
    is10to12pm = true;
    is12to2pm = false;
    is2to4pm = false;
    is4to6pm = false;
    is6to8pm = false;
    is8to10pm = false;
    emit(From10to12pmState());
  }

  from12to2pm() {
    selectedTime = "12 - 2 ${AppStrings.pm.tr()}";
    is6to8am = false;
    is8to10am = false;
    is10to12pm = false;
    is12to2pm = true;
    is2to4pm = false;
    is4to6pm = false;
    is6to8pm = false;
    is8to10pm = false;
    emit(From12to2pmState());
  }

  from2to4pm() {
    selectedTime = "2 - 4 ${AppStrings.pm.tr()}";
    is6to8am = false;
    is8to10am = false;
    is10to12pm = false;
    is12to2pm = false;
    is2to4pm = true;
    is4to6pm = false;
    is6to8pm = false;
    is8to10pm = false;
    emit(From2to4pmState());
  }

  from4to6pm() {
    selectedTime = "4 - 6 ${AppStrings.am.tr()}";
    is6to8am = false;
    is8to10am = false;
    is10to12pm = false;
    is12to2pm = false;
    is2to4pm = false;
    is4to6pm = true;
    is6to8pm = false;
    is8to10pm = false;
    emit(From4to6pmState());
  }

  from6to8pm() {
    selectedTime = "6 - 8 ${AppStrings.pm.tr()}";
    is6to8am = false;
    is8to10am = false;
    is10to12pm = false;
    is12to2pm = false;
    is2to4pm = false;
    is4to6pm = false;
    is6to8pm = true;
    is8to10pm = false;
    emit(From6to8pmState());
  }

  from8to10pm() {
    selectedTime = "8 - 10 ${AppStrings.pm.tr()}";
    is6to8am = false;
    is8to10am = false;
    is10to12pm = false;
    is12to2pm = false;
    is2to4pm = false;
    is4to6pm = false;
    is6to8pm = false;
    is8to10pm = true;
    emit(From8to10pmState());
  }

  void onDaySelected(selectedDay, focusedDay) {
    newSelectedDay = selectedDay;
    newFocusedDay = focusedDay;
    emit(SelectDateFromTableState());
    print("${newSelectedDay
        .toString()
        .split(" ")
        .first}");
    print("${newFocusedDay
        .toString()
        .split(" ")
        .first}");
  }
}
