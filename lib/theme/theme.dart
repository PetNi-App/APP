import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.white,
      secondary: Color(0xFFFDAAA2),
    );

    return ThemeData.from(
      colorScheme: colorScheme,
      useMaterial3: true,
    ).copyWith(
      navigationBarTheme: NavigationBarThemeData(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: colorScheme.secondary);
          }
          return IconThemeData(color: Colors.grey);
        }),
      ),
    );
  }

  static ThemeData dark() => light();
}
