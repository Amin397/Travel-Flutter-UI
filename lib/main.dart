import 'package:flutter/material.dart';
import 'package:travelflutterui/screen/home_screen.dart';

void main(){
  runApp(MaterialApp(
    title: "Flutter travel UI",
    theme: ThemeData(
      primaryColor: Color(0xFF3EBACE),
      accentColor: Color(0xFFD8ECF1),
      scaffoldBackgroundColor: Color(0xFFF3F5F7),
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}