import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadethDetailsScreen.dart';
import 'package:islami/home/quran/suraDetailsScreen.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyThemeData {
  static const Color PRIMARY_COLOR = Color.fromARGB(255, 183, 147, 95);
  static const Color PRIMARY_COLOR_DARK = Color.fromARGB(255, 20, 26, 46);
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
    scaffoldBackgroundColor: Colors.transparent, // 3l4an tb2a 3ala el app kolo
    primaryColor: MyThemeData.PRIMARY_COLOR_DARK,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        )
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      theme: MyThemeData.LIGHT_THEME,
      darkTheme: MyThemeData.DARK_THEME,

      routes: {
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
        SuraDetailsScreen.ROUTE_NAME: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.ROUTE_NAME: (context) => HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}
