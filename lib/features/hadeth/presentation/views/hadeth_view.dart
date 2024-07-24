import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hadeth_detials_view.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethData> allHadethContent = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    if (allHadethContent.isEmpty) loadData();
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_header.png",
          height: mediaQuery.height * 0.2,
        ),
        Divider(
          color: theme.primaryColor,
          thickness: 1.2,
        ),
        const Text(
          "الاحاديث",
          style: TextStyle(
              fontFamily: "El Messiri",
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
        Divider(
          color: theme.primaryColor,
          thickness: 1.2,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  HadethDetailsView.routeName,
                  arguments: allHadethContent[index],
                );
              },
              child: Text(
                allHadethContent[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "El Messiri",
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
            ),
            itemCount: allHadethContent.length,
          ),
        )
      ],
    );
  }

  Future<void> loadData() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadethList = content.split("#");

    for (int i = 0; i < allHadethList.length; i++) {
      String singleHadeth = allHadethList[i].trim();

      int titleIndex = singleHadeth.indexOf("\n");

      String title = singleHadeth.substring(0, titleIndex);
      String content = singleHadeth.substring(titleIndex + 1);

      HadethData hadethData = HadethData(
        title,
        content,
      );
      allHadethContent.add(hadethData);
    }
    setState(() {});
  }
}

class HadethData {
  final String title;
  final String content;

  HadethData(this.title, this.content);
}
