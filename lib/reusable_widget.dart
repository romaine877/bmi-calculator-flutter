import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({this.colour, this.cardChild, this.onPressed, this.delayAnimation});

  final Color colour;
  final Widget cardChild;
  final Function onPressed;
  final int delayAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: Duration(milliseconds: delayAnimation),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
