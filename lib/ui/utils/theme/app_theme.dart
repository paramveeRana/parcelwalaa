import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFFFCA26);
  static const Color primaryLight = Color(0xFFFFF3D6);
  static const Color text = Color(0xFF2D2D2D);
  static const Color textLight = Color(0xFF666666);
  static const Color background = Colors.white;
  static const Color divider = Color(0xFFEEEEEE);

  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;

  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;

  static BoxShadow get shadowSmall => BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 2),
      );

  static BoxShadow get shadowMedium => BoxShadow(
        color: Colors.black.withOpacity(0.08),
        blurRadius: 15,
        offset: const Offset(0, 4),
      );

  static const TextStyle headingLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: text,
    height: 1.2,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: text,
    height: 1.2,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: text,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textLight,
    height: 1.5,
  );

  static ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: paddingL,
          vertical: paddingM,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusS),
        ),
      );
}
