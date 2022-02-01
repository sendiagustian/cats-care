import 'package:flutter/material.dart';

class AppStyle {
  static StyleColor styleColor = const StyleColor();
}

class StyleColor {
  const StyleColor();
  MaterialColor get primarySwatchColor => const MaterialColor(
        0xFFFFDE59,
        <int, Color>{
          50: Color(0xFFFFDE59),
          100: Color(0xFFFFDE59),
          200: Color(0xFFFFDE59),
          300: Color(0xFFFFDE59),
          400: Color(0xFFFFDE59),
          500: Color(0xFFFFDE59),
          600: Color(0xFFFFDE59),
          700: Color(0xFFFFDE59),
          800: Color(0xFFFFDE59),
          900: Color(0xFFFFDE59),
        },
      );

  Color get primaryColor => const Color(0xFFFFDE59);
  Color get accentColor => const Color(0xFFFFF7BE);
  Color get redColor => const Color(0xFFFF1616);
  Color get greenColor => const Color(0xFF008037);
}
