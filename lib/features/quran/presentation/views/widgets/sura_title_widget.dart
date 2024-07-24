import 'package:flutter/material.dart';

// unVersioned Files
// Versioned Files

// commit
class SuraTitleWidget extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const SuraTitleWidget({
    super.key,
    required this.suraName,
    required this.suraNumber,
  });

  @override
  Widget build(BuildContext context) {
    //var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        Container(
          height: 38,
          width: 1,
          color: theme.primaryColor,
        ),
        Expanded(
          child: Text(
            suraName,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
