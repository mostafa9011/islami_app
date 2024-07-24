// Localozation
// Theme Dark and Light
// State Management Bloc (Cubit)
// read data from files

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/core/config/application_theme_manager.dart';
import 'package:islam_app_c10_sun_4pm/features/settings/manager/cubit.dart';
import 'package:islam_app_c10_sun_4pm/features/settings/manager/states.dart';
import 'package:islam_app_c10_sun_4pm/features/layout/presentation/layout_view.dart';
import 'package:islam_app_c10_sun_4pm/features/hadeth/presentation/views/hadeth_detials_view.dart';
import 'package:islam_app_c10_sun_4pm/features/quran/presentation/views/quran_details.dart';
import 'package:islam_app_c10_sun_4pm/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

//mostafa mohamed
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
