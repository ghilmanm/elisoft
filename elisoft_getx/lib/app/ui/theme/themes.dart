import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants/color.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: PRIMARY_COLOR,
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      shadowColor: Colors.grey,
      textTheme: GoogleFonts.robotoTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: BUTTON_COLOR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      )));
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.grey[900],
    cardColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey[800],
    shadowColor: Colors.grey,
    textTheme: GoogleFonts.robotoTextTheme(),
  );
}
