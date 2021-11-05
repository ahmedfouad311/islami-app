import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadethDetailsScreen.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethNameWidget extends StatelessWidget {
  HadethItem item;

  HadethNameWidget(this.item);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.ROUTE_NAME,
            arguments: item);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Text(
          item.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color:
            provider.isDarkMode() ? Colors.white :
            Colors.black,
          ),
        ),
      ),
    );
  }
}
