// lang_change.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangCubit extends Cubit<Locale> {
  LangCubit() : super(Locale('en'));  // Default to 'en' when initializing

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (type == Locale('en')) {
      await sp.setString('langage_code', 'en');
    } else if (type == Locale('hi')) {
      await sp.setString('langage_code', 'hi');
    } else {
      await sp.setString('langage_code', 'mr');
    }
    emit(type);  // Emit the new locale to update the state
  }
}
