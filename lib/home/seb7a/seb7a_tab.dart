import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/main.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class Seb7aTab extends StatefulWidget {
  @override
  _TasbehTabState createState() => _TasbehTabState();
}

class _TasbehTabState extends State<Seb7aTab> {
  int counter = 0;
  double angle = 0;

  List<String> seb7a = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله'
  ];
  int index = 0;
  String text = '';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.08),
                child: GestureDetector(
                  onTap: () {
                    counter++;
                    angle = angle + 30;
                    setState(() {
                      if (counter % 33 == 0) {
                        if (index == 4) {
                          index = 0;
                        }
                        else {
                          index++;
                        }
                        text = seb7a[index];
                      }
                    });
                  },
                  child: Transform.rotate(
                    angle: angle,
                    child: Image(
                      image: provider.isDarkMode() ? AssetImage(
                          'assets/images/body of seb7a dark.png') :
                      AssetImage('assets/images/body of seb7a.png'),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: MediaQuery
                    .of(context)
                    .size
                    .width * 0.07),
                child: Image(
                    image: provider.isDarkMode() ? AssetImage(
                        'assets/images/head of seb7a dark.png') :
                    AssetImage('assets/images/head of seb7a.png')
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.number_of_praises,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: provider.isDarkMode() ? Colors.white :
                Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: provider.isDarkMode() ? MyThemeData.PRIMARY_COLOR_DARK :
              Color.fromARGB(183, 183, 147, 95),
            ),
            child: Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: provider.isDarkMode() ? Colors.white :
                Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: provider.isDarkMode() ? MyThemeData
                  .PRIMARY_COLOR_DARK_ACCENT :
              Color.fromARGB(210, 183, 147, 95),
            ),
            child: Text(
              text = seb7a[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35,
                  color: provider.isDarkMode() ? Colors.black :
                  Colors.white
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  provider.isDarkMode()
                      ? MyThemeData.PRIMARY_COLOR_DARK_ACCENT
                      :
                  Color.fromARGB(210, 183, 147, 95)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
            onPressed: () {
              setState(() {

              });
              counter = 0;
              index = 0;
            },
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                AppLocalizations.of(context)!.reset,
                style: TextStyle(
                  fontSize: 22,
                  color: provider.isDarkMode() ? Colors.black :
                  Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
