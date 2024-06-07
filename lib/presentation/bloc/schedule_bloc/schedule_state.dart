part of 'schedule_cubit.dart';

@immutable
abstract class ScheduleState {}

class ScheduleInitial extends ScheduleState {}
class From6to8amState extends ScheduleState {}
class From8to10amState extends ScheduleState {}
class From10to12pmState extends ScheduleState {}
class From12to2pmState extends ScheduleState {}
class From2to4pmState extends ScheduleState {}
class From4to6pmState extends ScheduleState {}
class From6to8pmState extends ScheduleState {}
class From8to10pmState extends ScheduleState {}
class SelectDateFromTableState extends ScheduleState {}
class SelectedDayPredicateState extends ScheduleState {}
