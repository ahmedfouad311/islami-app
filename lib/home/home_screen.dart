import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/settings/settings_tab.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'hadeth/hadeth_tab.dart';
import 'quran/quran_tab.dart';
import 'radio/radio_tab.dart';
import 'seb7a/seb7a_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'Home Screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    Seb7aTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image(
          image:
          provider.isDarkMode() ? AssetImage(
              'assets/images/main_background_dark.png') :
          AssetImage('assets/images/main_background.png'),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.app_title,
            ),
          ),
          bottomNavigationBar: Theme(
            // 3l4an 2a8ayar el background color le el bottom nav bar
            data: Theme.of(context).copyWith(
              canvasColor: Theme
                  .of(context)
                  .primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/quran.png'), size: 30,),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_ahadeth.png'), size: 30,),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_seb7a.png'), size: 30,),
                  label: AppLocalizations.of(context)!.tasbeh,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/radio.png'), size: 30,),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, size: 27,),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
          ),
          body: Container(
            child: tabs[currentIndex],
          ),
        ),
      ],
    );
  }
}
