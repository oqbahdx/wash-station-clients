part of 'select_language_cubit.dart';

@immutable
abstract class SelectLanguageState {}

class SelectLanguageInitial extends SelectLanguageState {}
class MakeItArabicLanguageState extends SelectLanguageState {}
class MakeItEnglishLanguageState extends SelectLanguageState {}
