import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/hadethNameWidget.dart';

import '../../main.dart';

class HadethTab extends StatefulWidget {
  @override
  _HadethTabState createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (allHadethItems.isEmpty) {
      loadHadethFile(); // la2ni 3ayz 22ra el 2a7ades 2wel ma23ml build le el screen de
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image(
            image: AssetImage('assets/images/hadeth_image.png'),
          ),
        ),
        Expanded(
          flex: 2,
          child: allHadethItems.isEmpty ? Center(
              child: CircularProgressIndicator()) :
          ListView.separated(
            itemBuilder: (context, index) {
              return HadethNameWidget(allHadethItems[index]);
            },
            separatorBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(
                  height: 10,
                  thickness: 1,
                  color: MyThemeData.PRIMARY_COLOR,
                ),
              );
            },
            itemCount: allHadethItems.length,
          ),
        ),
      ],
    );
  }

  List<HadethItem> allHadethItems = [];

  void loadHadethFile() async {
    List<HadethItem> allHadethData = [];
    String fileContent = await rootBundle.loadString('assets/files/hadeth.txt');
    List<String> allAhadeth = fileContent.split('#\r\n');
    for (int i = 0; i < allAhadeth.length; i++) {
      List<String> singleHadethContent = allAhadeth[i].split('\n');
      String title = singleHadethContent[0];
      String content = '';
      for (int j = 1; j < singleHadethContent.length; j++) {
        content = content + singleHadethContent[j] + ' ';
      }
      HadethItem item = HadethItem(title, content);
      allHadethData.add(item);
      allHadethItems = allHadethData;
      setState(() {

      });
    }
  }
}

class HadethItem {
  String title;
  String content;

  HadethItem(this.title, this.content);
}
