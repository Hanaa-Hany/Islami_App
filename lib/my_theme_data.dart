import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class MyThemeData {
  ThemeData darkTheme=ThemeData(
  scaffoldBackgroundColor : Colors.transparent,
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      //backgroundColor: AppColors.primaryDark,
      //type: BottomNavigationBarType.fixed,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: AppColors.primaryDark),
      titleTextStyle: TextStyle(
        color: AppColors.primaryDark,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      centerTitle: true
    )
  );
}