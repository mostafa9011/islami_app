import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/cubits/cubit.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';
import 'package:islam_app_c10_sun_4pm/moduls/hadeth/page/hadeth_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/quran/page/quran_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/radio/page/radio_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/settings/page/settings_view.dart';
import 'package:islam_app_c10_sun_4pm/moduls/tasbeh/page/tasbeh_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = "layout";

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var cubitManager = BlocProvider.of<CubitApp>(context);
    var lacal = AppLocalizations.of(context)!;
    return BlocConsumer<CubitApp, StatesApp>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  cubitManager.isLight()
                      ? "assets/images/main_background.png"
                      : "assets/images/main_bg_dark.png",
                ),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(lacal.islami),
            ),
            body: screens[currentIndex], // depending on index
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/images/quran_icn.png",
                    ),
                  ),
                  label: lacal.quran,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/images/hadeth_icn.png",
                    ),
                  ),
                  label: lacal.hadith,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/images/sebha_icn.png",
                    ),
                  ),
                  label: lacal.tasbeih,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/images/radio_icn.png",
                    ),
                  ),
                  label: lacal.radio,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.settings,
                  ),
                  label: lacal.settings,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
