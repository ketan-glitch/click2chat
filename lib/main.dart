import 'package:click2chat/pages/home.dart';
import 'package:click2chat/pages/temp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Click2Chat',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: 'Mclaren',
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    // home: ScafTest(
    //   type: null,
    // ),
    home: Home(title: 'Click2Chat'),
  ));
}
