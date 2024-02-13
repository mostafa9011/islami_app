import 'package:flutter/material.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
        child: Column(
      children: [
        const Spacer(flex: 2),
        Image.asset('assets/images/radio.png'),
        const Spacer(flex: 1),
         Text(
          'اذاعه القران الكريم',
          style: theme.textTheme.bodyLarge,
        ),
        const Spacer(flex: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.skip_previous,
              size: 30,
              color: theme.primaryColor,
            ),
            Icon(
              Icons.play_arrow,
              size: 55,
              color: theme.primaryColor,
            ),
            Icon(
              Icons.skip_next,
              size: 30,
              color: theme.primaryColor,
            ),
          ],
        ),
        const Spacer(flex: 2),
      ],
    ));
  }
}
