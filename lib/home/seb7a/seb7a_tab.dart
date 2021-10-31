import 'package:flutter/material.dart';

class Seb7aTab extends StatefulWidget {
  @override
  _TasbehTabState createState() => _TasbehTabState();
}

class _TasbehTabState extends State<Seb7aTab> {
  int counter = 0;

  List<String> seb7a = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر'
  ];
  int index = 0;
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              counter++;
              setState(() {
                if (counter > 33) {
                  counter = 0;
                  if (index == 3) {
                    index = 0;
                  }
                  else {
                    index++;
                  }
                  text = seb7a[index];
                }
              });
            },
            child: Image(
              image: AssetImage('assets/images/body of seb7a.png'),
            ),
          ),
          Text(
            'عدد التسبيحات',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(183, 183, 147, 95),
                ),
                child: Text(
                  '$counter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(210, 183, 147, 95),
                ),
                child: Text(
                  text = seb7a[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
