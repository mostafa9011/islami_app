// 1- Localozation
// 2- Theme Dark and Light
// 3- State Management
// 4- read data from files

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/config/application_theme_manager.dart';
import 'package:islam_app_c10_sun_4pm/cubits/cubit.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';
import 'package:islam_app_c10_sun_4pm/layout/layout_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/hadeth/page/hadeth_detials_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/quran/page/quran_details.dart';
import 'package:islam_app_c10_sun_4pm/moduls/splash/page/splash_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => CubitApp(EnglishInitialLanguage()),
      child: BlocConsumer<CubitApp, StatesApp>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(
              BlocProvider.of<CubitApp>(context).currentLanguage,
            ),
            title: 'Isalmi App',
            debugShowCheckedModeBanner: false,
            theme: ApplicationThemeManager.lightTheme,
            //theme: BlocProvider.of<CubitApp>(context).currentTheme,
            darkTheme: ApplicationThemeManager.darkTheme,
            themeMode: BlocProvider.of<CubitApp>(context).currentTheme,
            initialRoute: SplashView.routeName,
            routes: {
              SplashView.routeName: (context) => const SplashView(),
              LayoutView.routeName: (context) => const LayoutView(),
              QuranDetailsView.routeName: (context) => const QuranDetailsView(),
              HadethDetailsView.routeName: (context) =>
                  const HadethDetailsView(),
            },
          );
        },
      ),
    );
  }
}
