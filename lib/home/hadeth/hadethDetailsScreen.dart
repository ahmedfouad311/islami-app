import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'Hadeth details Screen';

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as HadethItem;
    return Stack(
      children: [
        Image(
          image: AssetImage('assets/images/main_background.png'),
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              arguments.title,
              style: TextStyle(),
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 120, horizontal: 50),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: SingleChildScrollView(
              child: Text(
                arguments.content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}