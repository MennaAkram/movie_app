import 'package:flutter/material.dart';

class AppTextsTheme extends ThemeExtension<AppTextsTheme> {
  static const _baseFamily = "Montserrat";

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  const AppTextsTheme._internal(
      {required this.titleLarge,
      required this.titleMedium,
      required this.titleSmall,
      required this.bodyLarge,
      required this.bodyMedium,
      required this.bodySmall,
      required this.labelLarge,
      required this.labelMedium,
      required this.labelSmall
      });

  factory AppTextsTheme.main() => const AppTextsTheme._internal(
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: _baseFamily,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: _baseFamily,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: _baseFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: _baseFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontFamily: _baseFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),bodySmall: TextStyle(
      fontFamily: _baseFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
        fontFamily: _baseFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400
    ),
    labelMedium: TextStyle(
      fontFamily: _baseFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: _baseFamily,
      fontWeight: FontWeight.w400,
      fontSize: 10,
    ),
  );

  @override
  ThemeExtension<AppTextsTheme> copyWith() {
    return AppTextsTheme.main();
  }

  @override
  ThemeExtension<AppTextsTheme> lerp(
      covariant ThemeExtension<AppTextsTheme>? other, double t) =>
      this;
}
