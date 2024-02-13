import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islam_app_c10_sun_4pm/cubits/cubit.dart';
import 'package:islam_app_c10_sun_4pm/cubits/states.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  List<String> tasbeh = [
    "سبحان الله",
    "الحمدلله",
    "لا اله الا الله ",
    "الله اكبر",
  ];
  int index = 0;
  int count = 0;
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    var cubitManager = BlocProvider.of<CubitApp>(context);
    var theme = Theme.of(context);
    return BlocConsumer<CubitApp, StatesApp>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Image.asset(
                  cubitManager.isLight()
                      ? 'assets/images/head of seb7a.png'
                      : 'assets/images/head_of_seb7a_dark.png',
                ),
              ),
              AnimatedRotation(
                duration: const Duration(milliseconds: 1),
                turns: turns,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      turns += 0.1;
                      if (count == 33) {
                        if (index == 3) {
                          index = 0;
                        } else {
                          index++;
                        }
                        count = 0;
                      } else {
                        count++;
                      }
                    });
                  },
                  child: Image.asset(
                    cubitManager.isLight()
                        ? 'assets/images/body of seb7a.png'
                        : 'assets/images/body_of_seb7a_dark.png',
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Text('عدد التسبيحات', style: theme.textTheme.bodyLarge),
              const Spacer(flex: 1),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: cubitManager.isLight()
                        ? const Color(0xffCAB597)
                        : const Color(0xff141A2E),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: cubitManager.isLight() ? Colors.black : Colors.white,
                    fontFamily: "El Messiri",
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  tasbeh[index],
                  style: TextStyle(
                    color: cubitManager.isLight() ? Colors.white : Colors.black,
                    fontFamily: "El Messiri",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        );
      },
    );
  }
}
