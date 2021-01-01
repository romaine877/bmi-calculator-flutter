import 'package:flutter/material.dart';

class ListStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: Colors.white,
          elevation: 40,
          child: ListTile(
            leading: Icon(Icons.ac_unit, color: Colors.black,),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("data", style: TextStyle(color: Colors.black)), Text("row", style: TextStyle(color: Colors.black))],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("data - more data", style: TextStyle(color: Colors.black),), Text("row", style: TextStyle(color: Colors.black))],
            ),
          ),
        ),
      ),
    );
  }
}
