import 'dart:math';

import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Transform.rotate(
          angle: pi/4,
                  child: Icon(
            icon,
            size: 80,
          ),
          
        ),
        
        Text(label)
      ],
    );
  }
}