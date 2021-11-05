import 'package:flutter/material.dart';
import 'package:islami/home/quran/suraDetailsScreen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraNameWidget extends StatelessWidget {
  String suraName;
  int index;

  SuraNameWidget(this.suraName, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.ROUTE_NAME,
            arguments: SuraDetailsArguments(suraName, index));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          suraName,
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
