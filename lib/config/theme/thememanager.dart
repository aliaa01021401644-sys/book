
import 'package:flutter/material.dart';

import 'colorsmanager.dart';

class ThemeManager{
  static final ThemeData light = ThemeData(
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.blue2,
          foregroundColor: ColorsManager.white,
          centerTitle: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorsManager.blue,fontSize: 22)
      ),
      scaffoldBackgroundColor: ColorsManager.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.blue2,
          type: BottomNavigationBarType.fixed,
          selectedItemColor:  ColorsManager.white,
          unselectedItemColor: ColorsManager.white
      )
  );
}