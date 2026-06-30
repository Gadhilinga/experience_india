import 'package:flutter/material.dart';

class AppColors {

  // Main Colors
  static const Color primary = Color(0xFF0B1F3A);
  static const Color secondary = Color(0xFFFF7A00);

  // India Theme
  static const Color saffron = Color(0xFFFF7A00);
  static const Color indiaGreen = Color(0xFF138808);
  static const Color indiaBlue = Color(0xFF1A5FB4);
  static const Color white = Color(0xFFFFFFFF);
  static const Color appColor = Color(0xFF10B981);


  // Neutral
  static const Color background = Color(0xFFF8F9FB);
  static const Color dark = Color(0xFF111827);
  static const Color grey = Color(0xFF6B7280);

  // Cards
  static const Color cardColor = Color(0xFFFFFFFF);

  // Gradients
  static const LinearGradient indiaGradient = LinearGradient(
    colors: [
      saffron,
      white,
      indiaGreen,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}