import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color primary;
  final Color secondary;
  final Color onPrimary;
  final Color onSecondary;
  final Color background;
  final Color onBackground87;
  final Color onBackground60;
  final Color onBackground38;
  final Color error;
  final Color card;
  final Color border;
  final Color star;

  const AppColorsTheme._internal(
      {required this.primary,
        required this.secondary,
        required this.onPrimary,
        required this.onSecondary,
        required this.background,
        required this.onBackground87,
        required this.onBackground60,
        required this.onBackground38,
        required this.error,
        required this.card,
        required this.border,
        required this.star});

  factory AppColorsTheme.light() {
    return const AppColorsTheme._internal(
        primary: Color(0xff845EC2),
        secondary: Color(0xffF3F4F9),
        onPrimary: Color(0xffFFFFFF),
        onSecondary: Color(0xffE4D3FF),
        background: Color(0xffF5F5F5),
        onBackground87: Color(0xde121212),
        onBackground60: Color(0x99121212),
        onBackground38: Color(0x61121212),
        error: Color(0xFFD92832),
        card: Color(0xffFFFFFF),
        border: Color(0x14845ec2),
        star: Color(0xffFFB128));
  }

  @override
  ThemeExtension<AppColorsTheme> copyWith() {
    return AppColorsTheme.light();
  }

  @override
  ThemeExtension<AppColorsTheme> lerp(
      covariant ThemeExtension<AppColorsTheme>? other, double t) =>
      this;
}
