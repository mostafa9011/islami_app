import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islam_app_c10_sun_4pm/cubits/cubit.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> languageList = [
      "English",
      "عربي",
    ];

    var cubitManager = BlocProvider.of<CubitApp>(context);
    var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return BlocConsumer<CubitApp, StatesApp>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  local.language,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                CustomDropdown(
                  decoration: CustomDropdownDecoration(
                    closedFillColor: cubitManager.isLight()
                        ? Colors.white
                        : const Color(
                            0xff141A2E,
                          ),
                    expandedFillColor: cubitManager.isLight()
                        ? Colors.white
                        : const Color(
                            0xff141A2E,
                          ),
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: cubitManager.isLight()
                          ? Colors.black
                          : Color(0xFFFACC1D),
                    ),
                    expandedSuffixIcon: Icon(
                      Icons.keyboard_arrow_up,
                      color: cubitManager.isLight()
                          ? Colors.black
                          : Color(0xFFFACC1D),
                    ),
                  ),
                  hintText: local.select_language,
                  items: languageList,
                  onChanged: (value) {
                    if (value == languageList[0]) {
                      BlocProvider.of<CubitApp>(context).swapToEnglish();
                    } else {
                      BlocProvider.of<CubitApp>(context).swapToArabic();
                    }
                    log(value);
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  local.theme,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                CustomDropdown(
                  decoration: CustomDropdownDecoration(
                    closedFillColor: cubitManager.isLight()
                        ? Colors.white
                        : const Color(
                            0xff141A2E,
                          ),
                    expandedFillColor: cubitManager.isLight()
                        ? Colors.white
                        : const Color(
                            0xff141A2E,
                          ),
                    closedSuffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: cubitManager.isLight()
                          ? Colors.black
                          : Color(0xFFFACC1D),
                    ),
                    expandedSuffixIcon: Icon(
                      Icons.keyboard_arrow_up,
                      color: cubitManager.isLight()
                          ? Colors.black
                          : Color(0xFFFACC1D),
                    ),
                  ),
                  hintText: local.select_theme,
                  items: [
                    local.light,
                    local.dark,
                  ],
                  onChanged: (value) {
                    if (value == local.light) {
                      BlocProvider.of<CubitApp>(context).swapToLightTheme();
                    } else {
                      BlocProvider.of<CubitApp>(context).swapToDarkTheme();
                    }
                    log(value);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
