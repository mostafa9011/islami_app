import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';

class CubitApp extends Cubit<StatesApp> {
  CubitApp(super.initialState);

  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;
  void swapToArabic() {
    currentLanguage = 'ar';
    emit(ArabicLanguage());
  }

  void swapToEnglish() {
    currentLanguage = 'en';
    emit(EnglishInitialLanguage());
  }

  void swapToDarkTheme() {
    currentTheme = ThemeMode.dark;
    emit(DarkState());
  }

  void swapToLightTheme() {
    currentTheme = ThemeMode.light;
    emit(LightState());
  }

  // getBgImage() {
  //   if (currentTheme == ThemeMode.light) {
  //     mainBgImage = "assets/images/main_background.png";
  //     emit(LightState());
  //   } else {
  //     mainBgImage = "assets/images/main_bg_dark.png";
  //     emit(DarkState());
  //   }
  // }
  bool isLight(){
    return currentTheme == ThemeMode.light;
  }
}
