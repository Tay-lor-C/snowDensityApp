import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE2E6EB),
  100: Color(0xFFB7BFCC),
  200: Color(0xFF8795AA),
  300: Color(0xFF576B88),
  400: Color(0xFF334B6F),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF0D264E),
  700: Color(0xFF0B2044),
  800: Color(0xFF081A3B),
  900: Color(0xFF04102A),
});
const int _primaryPrimaryValue = 0xFF0F2B55;

const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF648BFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF003FFD),
  700: Color(0xFF0039E4),
});
const int _primaryAccentValue = 0xFF3165FF;

const Color backgroundColor = const Color(0xFFe4e3e7);