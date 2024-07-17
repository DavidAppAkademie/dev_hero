import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = FlexThemeData.light(
    scheme: FlexScheme.blueWhale, textTheme: GoogleFonts.ubuntuTextTheme());

ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.blueWhale, textTheme: GoogleFonts.ubuntuTextTheme());
