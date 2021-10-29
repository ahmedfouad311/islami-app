import 'package:flutter/material.dart';
import 'package:islami/home/hadeth_tab.dart';
import 'package:islami/home/quran_tab.dart';
import 'package:islami/home/radio_tab.dart';
import 'package:islami/home/seb7a_tab.dart';
import 'package:islami/main.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage('assets/images/main_background.png'),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'أسلامي',
              ),
            ),
          ),
          bottomNavigationBar: Theme(
            // 3l4an 2a8ayar el background color le el bottom nav bar
            data: Theme.of(context).copyWith(
              canvasColor: MyThemeData.PRIMARY_COLOR,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/quran.png')),
                  label: 'القرآن',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_ahadeth.png')),
                  label: 'الأحاديث',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_seb7a.png')),
                  label: 'السبحة',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/radio.png')),
                  label: 'الراديو',
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
