import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/cubits/cubit.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';
import 'package:islam_app_c10_sun_4pm/moduls/quran/page/quran_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = "quran_details";

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetial;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var cubitManager = BlocProvider.of<CubitApp>(context);
    var local = AppLocalizations.of(context)!;

    // sync Vs async
    if (versesList.isEmpty) loadData(args.suraNumber);

    return BlocConsumer<CubitApp, StatesApp>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                cubitManager.isLight()
                    ? "assets/images/main_background.png"
                    : 'assets/images/main_bg_dark.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: cubitManager.isLight() ? Colors.black : Colors.white,
              ),
              title: Text(
                local.islami,
                style: TextStyle(
                  color: cubitManager.isLight() ? Colors.black : Colors.white,
                ),
              ),
            ),
            body: Container(
              width: mediaQuery.width,
              height: mediaQuery.height,
              margin: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 15,
                bottom: 80,
              ),
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: cubitManager.isLight()
                    ? const Color(0XFFF8F8F8).withOpacity(0.8)
                    : const Color(0xff141A2E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "سورة ${args.suraName}",
                        style: cubitManager.isLight()
                            ? theme.textTheme.bodyLarge
                            : theme.textTheme.bodyLarge!.copyWith(
                                color: const Color(0xFFFACC1D),
                              ),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.play_circle_filled_rounded,
                        size: 28,
                        color: cubitManager.isLight()
                            ? Colors.black
                            : const Color(0xFFFACC1D),
                      ),
                    ],
                  ),
                  Divider(
                    color: theme.primaryColor,
                  ),
                  if (versesList.isEmpty)
                    Center(
                      child: CircularProgressIndicator(
                        color: theme.primaryColor,
                      ),
                    ),
                  if (versesList.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Text(
                          "{${index + 1}} ${versesList[index]}",
                          textAlign: TextAlign.center,
                          style: cubitManager.isLight()
                              ? theme.textTheme.bodyMedium
                              : theme.textTheme.bodyMedium!.copyWith(
                                  color: const Color(0xFFFACC1D),
                                ),
                        ),
                        itemCount: versesList.length,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> loadData(String suraNumber) async {
    String suraContent =
        await rootBundle.loadString("assets/files/$suraNumber.txt");
    versesList = suraContent.split("\n");
    setState(() {});
  }
}
