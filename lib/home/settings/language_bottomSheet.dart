import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color:
          provider.isDarkMode() ? MyThemeData.PRIMARY_COLOR_DARK : Colors.white,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemStyle('English', context)
                  : getUnSelectedItemStyle('English', context),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemStyle('العربية', context)
                  : getUnSelectedItemStyle('العربية', context),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemStyle(String text, BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: provider.isDarkMode()
                ? MyThemeData.PRIMARY_COLOR_DARK_ACCENT
                : MyThemeData.PRIMARY_COLOR,
          ),
        ),
        Icon(
          Icons.check,
          color: provider.isDarkMode()
              ? MyThemeData.PRIMARY_COLOR_DARK_ACCENT
              : MyThemeData.PRIMARY_COLOR,
        ),
      ],
    );
  }

  Widget getUnSelectedItemStyle(String text, BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: provider.isDarkMode() ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
