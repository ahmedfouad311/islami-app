import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadethDetailsScreen.dart';
import 'package:islami/home/quran/suraDetailsScreen.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';

void main() {
  runApp( // 3amalt call le el provider hna 3l4an el changes el hat7sal hat7sal fe el
    // app kolo bas law kan el changes hat7sal fe widgets mo3ayana haro7 23ml
    // call le el provider 3and el screen el hay7sal feha changes
      ChangeNotifierProvider(
        create: (context) {
          return AppConfigProvider();
        },
        child: MyApp(),
      )
  );
}

class MyThemeData {
  static const Color PRIMARY_COLOR = Color.fromARGB(255, 183, 147, 95);
  static const Color PRIMARY_COLOR_DARK = Color.fromARGB(255, 20, 26, 46);
  static const Color PRIMARY_COLOR_DARK_ACCENT = Color.fromARGB(
      255, 250, 204, 29);
  static final ThemeData LIGHT_THEME = ThemeData(
    primaryTextTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 30,
        )
    ),
    scaffoldBackgroundColor: Colors.transparent, // 3l4an tb2a 3ala el app kolo
    primaryColor: MyThemeData.PRIMARY_COLOR,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  );
  static final ThemeData DARK_THEME = ThemeData(
    primaryTextTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 30,
        )
    ),
    scaffoldBackgroundColor: Colors.transparent, // 3l4an tb2a 3ala el app kolo
    primaryColor: MyThemeData.PRIMARY_COLOR_DARK,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: MyThemeData.PRIMARY_COLOR_DARK_ACCENT,
      unselectedItemColor: Colors.white,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyThemeData.LIGHT_THEME,
      darkTheme: MyThemeData.DARK_THEME,
      themeMode: provider.appTheme,

      routes: {
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
        SuraDetailsScreen.ROUTE_NAME: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.ROUTE_NAME: (context) => HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}
