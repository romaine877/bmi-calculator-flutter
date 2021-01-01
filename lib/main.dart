import 'package:bmi_calculator/list_stock.dart';
import 'package:bmi_calculator/results_page.dart';

import 'input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
         primaryColor: Color(0xff0A0e21),
        scaffoldBackgroundColor: Color(0xff0A0e21),
        accentColor: Colors.pink,
        
      ),
      home: (InputPage()),
    );
  }
}


