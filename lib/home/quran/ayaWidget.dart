import 'package:flutter/material.dart';

class AyaWidget extends StatelessWidget {
  String aya;
  int index;

  AyaWidget(this.aya, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        aya + ' {${index + 1}}',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
