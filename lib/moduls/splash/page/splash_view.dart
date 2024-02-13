import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/cubits/cubit.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';
import 'package:islam_app_c10_sun_4pm/layout/layout_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(
          context,
          LayoutView.routeName,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    Size mediaQuery = MediaQuery.of(context).size;
    return BlocConsumer<CubitApp, StatesApp>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is EnglishInitialLanguage) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Image.asset(
              "assets/images/splash_background.png",
              height: mediaQuery.height,
              width: mediaQuery.width,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                height: mediaQuery.height,
                width: mediaQuery.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo_bg_dark.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Image.asset('assets/images/logo_dark.png'),
                ),
              )
              //  Image.asset(
              //   cubitManager.currentTheme == ThemeMode.light
              //       ? "assets/images/splash_background.png"
              //       : "assets/images/logo_bg_dark.png",
              //   height: mediaQuery.height,
              //   width: mediaQuery.width,
              //   fit: BoxFit.cover,
              // ),
              );
        }
      },
    );
  }
}
