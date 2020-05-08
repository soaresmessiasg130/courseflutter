import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowbefore/screens/list/places.dart';

void main() => runApp(
  KnowBefore()
);

class KnowBefore extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[600],
        accentColor: Colors.cyanAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueGrey[600],
          textTheme: ButtonTextTheme.primary
        ),
        iconTheme: IconThemeData(
          color: Colors.cyanAccent[700]
        ),
      ),
      home: ListPlaces(),
    );
  }

}
