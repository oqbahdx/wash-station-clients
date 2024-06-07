import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';

part 'select_language_state.dart';

class SelectLanguageCubit extends Cubit<SelectLanguageState> {
  SelectLanguageCubit() : super(SelectLanguageInitial());
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // makeItArabic(){
  //   _appPreferences.changeAppLanguage();
  //   context.setLocale(const Locale('ar', 'SA'));
  //   debugPrint("arabic");
  // }

}
