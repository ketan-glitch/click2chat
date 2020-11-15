import 'package:click2chat/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Click2Chat',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.teal,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    // home: Home(title: 'Click2Chat'),
    home: Home(title: 'Click2Chat'),
  ));
}
