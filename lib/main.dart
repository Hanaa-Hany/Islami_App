import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme:MyThemeData().darkTheme ,
      initialRoute: HomeScreen.routeName,
      routes:{
    HomeScreen.routeName :(context)=>HomeScreen(),
    } ,
    );
  }
}