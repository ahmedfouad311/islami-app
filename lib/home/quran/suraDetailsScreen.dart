import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/quran/ayaWidget.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'Sura Details';

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var arguments =
    ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    if (ayat.isEmpty) {
      readSura(arguments.index);
    }
    return Stack(
      children: [
        Image(
          image: provider.isDarkMode() ?
          AssetImage('assets/images/main_background_dark.png') :
          AssetImage('assets/images/main_background.png'),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              arguments.suraName,
            ),
          ),
          body: Container(
            child: ayat.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 100),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? MyThemeData.PRIMARY_COLOR_DARK
                      :
                  Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return AyaWidget(ayat[index], index);
                  },
                  itemCount: ayat.length,
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
                )),
          ),
        ),
      ],
    );
  }

  void readSura(int index) async {
    // de 3l4an el await ka2ni ba2olo may3ml4 build le el
    // class 8eer lma 2a5alas el func de el hya ta7t fa el async ka2ni ba2olo 23ml build
    // 3ady w wareny el view w 23ml el func fe nafs el wa2t w 2na hastanaha l7ad mat5alas
    // open file and read it (index+1).txt
    String fileName = 'assets/files/${index + 1}.txt';
    String fileContent = await rootBundle.loadString(fileName);
    List<String> verses = fileContent.split('\n');
    ayat = verses;
    setState(() {});
  }
}

class SuraDetailsArguments {
  String suraName;
  int index;

  SuraDetailsArguments(this.suraName, this.index);
}
