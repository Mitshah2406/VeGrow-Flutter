import 'package:flutter/material.dart';

class ThemeManager {
  static final lightTheme = ThemeData(primarySwatch: Colors.green,
    appBarTheme: AppBarTheme(backgroundColor: Colors.green),
    primaryColor: Colors.green,
    dividerColor: Color.fromARGB(255, 65, 209, 70)
  );
  static final darkTheme = ThemeData(

    dividerColor: Color.fromARGB(255, 255, 255, 255)  
  );
}
