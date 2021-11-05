import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class AyaWidget extends StatelessWidget {
  String aya;
  int index;

  AyaWidget(this.aya, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        aya + ' {${index + 1}}',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: provider.isDarkMode() ? MyThemeData.PRIMARY_COLOR_DARK_ACCENT :
          Colors.black,
        ),
      ),
    );
  }
}
