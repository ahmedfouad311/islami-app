import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
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
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDarkMode()
                  ? getUnSelectedItemStyle(
                      AppLocalizations.of(context)!.light, context)
                  : getSelectedItemStyle(
                      AppLocalizations.of(context)!.light, context),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDarkMode()
                  ? getSelectedItemStyle(
                      AppLocalizations.of(context)!.dark, context)
                  : getUnSelectedItemStyle(
                      AppLocalizations.of(context)!.dark, context),
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
