import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary1 = Color(0xFF693DB7);
  static const Color primary2 = Color(0xFF3B1281);
  static const Color primaryColor = Color(0xffe80202);

  static const Color wrong = Color(0xffF93D57);
  static const Color correct = Color(0xff5ED033);

  static const Color textColor = Color(0xFF0B0E23);
  static const Color backgroundcolor = Color(0xFFF1F1F2);
  static const Color green = Color(0xFF28BB7C);

  static const Color greentext = Color(0xFF2FB500);
  static const Color headerContainerColor = Color(0xFFF5F5F5);

  static const Color dividerColor = Color(0xffECECEC);

  static const Color blueText = Color(0xff406CB4);
  static const Color amber = Color(0xFFF9AA25);

  static LinearGradient questionGradient = LinearGradient(
    colors: [
      Color(0xffE15169),
      Color(0xffFFB041),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color textBlack = Color(0xff253746);

  static const Color greenText = Color(0xff028A58);
}
