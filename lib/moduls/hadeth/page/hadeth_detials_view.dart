import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/cubits/cubit.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';
import 'package:islam_app_c10_sun_4pm/moduls/hadeth/page/hadeth_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethDetailsView extends StatelessWidget {
  static const String routeName = "hadethDetails";

  const HadethDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var cubitManager = BlocProvider.of<CubitApp>(context);
    var local = AppLocalizations.of(context)!;
    // sync Vs async

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
                  Text(
                    args.title,
                    style: cubitManager.isLight()
                        ? theme.textTheme.bodyLarge
                        : theme.textTheme.bodyLarge!.copyWith(
                            color: const Color(0xFFFACC1D),
                          ),
                  ),
                  Divider(
                    color: theme.primaryColor,
                  ),
                  Text(
                    args.content,
                    textAlign: TextAlign.center,
                    style: cubitManager.isLight()
                        ? theme.textTheme.bodyMedium
                        : theme.textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFFFACC1D),
                          ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
