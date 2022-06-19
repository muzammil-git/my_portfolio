// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  
  final String text;
  const IntroCard({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 15),
              blurRadius: 25,
            )
          ],
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.black, width: 01),
        ),
        child: Text( 
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade900,
          ),
        ));
  }
}
