import 'package:flutter/material.dart';

ThemeData defaultTheme() {
  return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(
    background: const Color(0xff1E1B2E),
    primary: const Color(0xff1E1B2E),
    secondary: const Color(0xff674FFF),
    tertiary: const Color(0xffC6BEFB),
    error: const Color(0xffFF4F4F),
  ));
}
