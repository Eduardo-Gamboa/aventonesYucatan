import 'package:flutter/material.dart';

class Colors {
  const Colors();

  static const Color appBarTitle = Color(0xFFFFFFFF);
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = Color(0xFF414141);
  static const Color appBarGradientStart = Color(0xFF636363);
  static const Color appBarGradientEnd = Color(0xFF414141);

  //static const Color planetCard = const Color(0xFF434273);
  static const Color planetCard = Color(0xFFDCDCDC);
  //static const Color planetListBackground = const Color(0xFF3E3963);
  static const Color planetPageBackground = Color(0xffFFFFFF);
  static const Color planetTitle = Color(0xFF363636);
  static const Color planetLocation = Color(0xFF585858);
  static const Color planetDistance = Color(0xFF585858);
}

class Dimens {
  const Dimens();

  static const planetWidth = 100.0;
  static const planetHeight = 100.0;
}

class TextStyles {
  const TextStyles();

  static const TextStyle appBarTitle = TextStyle(
      color: Colors.appBarTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 36.0);

  static const TextStyle planetTitle = TextStyle(
      color: Colors.planetTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 24.0);

  static const TextStyle planetLocation = TextStyle(
      color: Colors.planetLocation,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 14.0);

  static const TextStyle planetDistance = TextStyle(
      color: Colors.planetDistance,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
      fontSize: 12.0);
}
