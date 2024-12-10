import 'package:flutter/material.dart';

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
    )
  );
}